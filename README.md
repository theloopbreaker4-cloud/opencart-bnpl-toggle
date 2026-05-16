# GCOMP BNPL Toggle

Per-product toggle to disable "ნაწილ-ნაწილ" (BNPL) payment methods (BOG BNPL, Credo BNPL, TBC BNPL) on selected products. Regular installment (განვადება) stays available.

## Why
BNPL providers charge 5% commission, which kills the margin on low-markup online products. Merchants need a way to disable BNPL on specific products while keeping regular installment options.

## Installation

1. **Run SQL** — `deploy.sql` via phpMyAdmin (adds `bnpl_disabled TINYINT` column to `oc_product`).
2. **Install OCMOD** — Extensions → Installer → upload `install_ocmod/gcomp_bnpl_toggle.ocmod.zip`.
3. **Refresh modifications** — Extensions → Modifications → click blue Refresh button.
4. **OPcache reset** — upload `clear.php` to `site/public_html/` and open in browser:
   ```php
   <?php opcache_reset(); echo "ok"; unlink(__FILE__);
   ```

### If Refresh fails with `rmdir: Directory not empty`

Manually delete `storage/modification/admin/` and `storage/modification/catalog/` via FTP, then Refresh again.

## Usage

1. **Catalog → Products → Edit a product**
2. Find **"ნაწილ-ნაწილ გათიშულია"** field (right above the Status field on the Data tab)
3. Set to **კი (Yes)** to hide BNPL methods at checkout for this product

When a cart contains any product with this flag set to `Yes`, all BNPL payment methods are hidden on the payment method step. Regular `*_installment` / `*_ganvadeba` methods remain visible.

## Detection rule

Payment method `code` is checked case-insensitive for substrings:
- `bnpl`
- `nawil`

If your BNPL gateway uses a different code, edit operation 4 in the XML.

## Files

```
bnpl_toggle/
├── site_upload/
│   ├── deploy.sql                          — adds bnpl_disabled column
│   └── install_ocmod/
│       ├── gcomp_bnpl_toggle.ocmod.xml     — source
│       └── gcomp_bnpl_toggle.ocmod.zip     — upload this via Installer
└── README.md
```
