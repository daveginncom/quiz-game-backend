#!/bin/bash
set -e

echo "🔍 Validating Terraform Configuration..."
echo ""

echo "1️⃣  Formatting check..."
terraform fmt -check -recursive || {
    echo "❌ Format check failed. Run 'terraform fmt' to fix."
    exit 1
}
echo "✅ Format check passed"
echo ""

echo "2️⃣  Initializing Terraform..."
terraform init -backend=false
echo "✅ Initialized"
echo ""

echo "3️⃣  Validating configuration..."
terraform validate
echo "✅ Validation passed"
echo ""

echo "4️⃣  Running security checks with tflint (if installed)..."
if command -v tflint &> /dev/null; then
    tflint --init
    tflint
    echo "✅ tflint passed"
else
    echo "⚠️  tflint not installed (optional)"
fi
echo ""

echo "✅ All validation checks passed!"
