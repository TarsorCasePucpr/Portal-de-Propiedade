-- Banco de dados: portal_propiedade
-- Criado: Março 2026
-- Motor: MySQL 8.0+
-- ⚠️ Nunca modificar manualmente — sempre atualizar este arquivo

SET FOREIGN_KEY_CHECKS = 0;
SET NAMES utf8mb4;

-- ─────────────────────────────────────────────
-- USERS
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS users (
    id            INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name          VARCHAR(100)        NOT NULL,
    email         VARCHAR(255)        NOT NULL UNIQUE,
    password_hash VARCHAR(255)        NOT NULL,       -- bcrypt cost 13
    is_active     TINYINT(1)          NOT NULL DEFAULT 0,
    mfa_enabled   TINYINT(1)          NOT NULL DEFAULT 0,
    mfa_secret    VARCHAR(64)         NULL,           -- TOTP secret (encriptado)
    created_at    DATETIME            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at    DATETIME            NOT NULL DEFAULT CURRENT_TIMESTAMP
                                               ON UPDATE CURRENT_TIMESTAMP,
    deleted_at    DATETIME            NULL,           -- soft delete
    INDEX idx_email (email),
    INDEX idx_active (is_active)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ─────────────────────────────────────────────
-- TOKENS (confirmação de email + recuperação de senha)
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS tokens (
    id          INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id     INT UNSIGNED        NOT NULL,
    token_hash  VARCHAR(64)         NOT NULL UNIQUE,  -- hash('sha256', $rawToken)
    type        ENUM('confirm','recovery','mfa_email') NOT NULL,
    expires_at  DATETIME            NOT NULL,
    used_at     DATETIME            NULL,             -- NULL = não usado ainda
    created_at  DATETIME            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_token_hash (token_hash),
    INDEX idx_user_type  (user_id, type)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ─────────────────────────────────────────────
-- PROPERTIES (produtos / propriedades)
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS properties (
    id           INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id      INT UNSIGNED        NOT NULL,        -- dono do anúncio
    title        VARCHAR(200)        NOT NULL,
    description  TEXT                NULL,
    price        DECIMAL(15,2)       NOT NULL,
    status       ENUM('active','inactive','sold','rented') NOT NULL DEFAULT 'active',
    created_at   DATETIME            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at   DATETIME            NOT NULL DEFAULT CURRENT_TIMESTAMP
                                               ON UPDATE CURRENT_TIMESTAMP,
    deleted_at   DATETIME            NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_status     (status),
    INDEX idx_user_id    (user_id),
    INDEX idx_price      (price),
    INDEX idx_deleted_at (deleted_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ─────────────────────────────────────────────
-- RATE LIMITS
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS rate_limits (
    id         INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ip         VARCHAR(45)  NOT NULL,                 -- IPv4 e IPv6
    action     VARCHAR(50)  NOT NULL,                 -- 'login', 'mfa', 'contact'
    created_at INT UNSIGNED NOT NULL,                 -- Unix timestamp
    INDEX idx_ip_action_time (ip, action, created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ─────────────────────────────────────────────
-- CONTACT MESSAGES
-- ─────────────────────────────────────────────
CREATE TABLE IF NOT EXISTS contact_messages (
    id           INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    property_id  INT UNSIGNED        NOT NULL,
    sender_name  VARCHAR(100)        NOT NULL,
    sender_email VARCHAR(255)        NOT NULL,
    message      TEXT                NOT NULL,
    ip           VARCHAR(45)         NOT NULL,
    created_at   DATETIME            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(id) ON DELETE CASCADE,
    INDEX idx_property_id (property_id),
    INDEX idx_created_at  (created_at)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

SET FOREIGN_KEY_CHECKS = 1;
