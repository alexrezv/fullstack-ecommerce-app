-- -----------------------------------------------------
-- Schema full-stack-ecommerce
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS ecommerce CASCADE;

CREATE SCHEMA ecommerce;

SET SCHEMA 'ecommerce';


-- -----------------------------------------------------
-- Table ecommerce.product_category
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS ecommerce.product_category
(
    id            BIGINT GENERATED ALWAYS AS IDENTITY,
    category_name VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table ecommerce.product
-- ----------------------------------------------------
CREATE TABLE IF NOT EXISTS ecommerce.product
(
    id             BIGINT GENERATED ALWAYS AS IDENTITY,
    sku            VARCHAR(255)   DEFAULT NULL,
    name           VARCHAR(255)   DEFAULT NULL,
    description    VARCHAR(255)   DEFAULT NULL,
    unit_price     DECIMAL(13, 2) DEFAULT NULL,
    image_url      VARCHAR(255)   DEFAULT NULL,
    active         BOOLEAN        DEFAULT TRUE,
    units_in_stock INTEGER        DEFAULT NULL,
    date_created   DATE           DEFAULT NULL,
    last_updated   DATE           DEFAULT NULL,
    category_id    BIGINT
        CONSTRAINT fk_category NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_category
        FOREIGN KEY (category_id)
            REFERENCES product_category (id)
);

-- -----------------------------------------------------
-- Table ecommerce.country
-- ----------------------------------------------------
CREATE TABLE IF NOT EXISTS ecommerce.country
(
    id   BIGINT NOT NULL,
    code VARCHAR(2) NULL DEFAULT NULL,
    name VARCHAR(255) NULL DEFAULT NULL,
    PRIMARY KEY (id)
);

-- -----------------------------------------------------
-- Table ecommerce.state
-- ----------------------------------------------------
CREATE TABLE IF NOT EXISTS ecommerce.state
(
    id   BIGINT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(255) NULL DEFAULT NULL,
    country_id BIGINT
        CONSTRAINT fk_country NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_country
        FOREIGN KEY (country_id)
            REFERENCES country (id)
);
