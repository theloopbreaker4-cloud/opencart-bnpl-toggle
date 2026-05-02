# GCOMP BNPL Toggle

Per-product toggle to disable "ნაწილ-ნაწილ" (BNPL) payment methods (BOG BNPL, Credo BNPL, TBC BNPL) on selected products. Regular installment (განვადება) stays available.

## Why
BNPL providers charge 5% commission, which kills the margin on low-markup online products. Merchants need a way to disable BNPL on specific products while keeping regular installment options.

## Installation
1. Run `deploy.sql` via phpMyAdmin
2. Install OCMOD: **Extensions → Installer** → upload `install_ocmod/gcomp_bnpl_toggle.ocmod.xml`
3. Refresh modifications: **Extensions → Modifications → Refresh**
4. Refresh modifications cache: **Dashboard → top-right Refresh button**

## Usage
1. Go to **Catalog → Products → Edit a product**
2. Find **"ნაწილ-ნაწილ გათიშულია"** field in the Data tab
3. Set to **კი (Yes)** to hide BNPL methods at checkout for this product

When a cart contains any product with this flag set to Yes, all BNPL payment methods are hidden on the payment method step. Regular `*_installment` / `*_ganvadeba` methods remain visible.
