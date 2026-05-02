-- =============================================
-- GCOMP.GE BNPL Toggle - Deploy SQL
-- Add per-product flag to disable BNPL payment methods
-- =============================================

-- Add flag column to product table
ALTER TABLE `oc_product` ADD COLUMN IF NOT EXISTS `bnpl_disabled` TINYINT(1) NOT NULL DEFAULT 0;

-- Index for fast checkout-time lookups
ALTER TABLE `oc_product` ADD INDEX IF NOT EXISTS `idx_bnpl_disabled` (`bnpl_disabled`);
