#!/bin/bash

# More Than Certified - Maintenance Page Deployment Script
# This script helps set up and deploy the maintenance page to GitHub Pages

set -e  # Exit on any error

echo "🚀 More Than Certified - Maintenance Page Deployment"
echo "=================================================="

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

print_info() {
    echo -e "${BLUE}ℹ${NC} $1"
}

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    print_error "This is not a git repository. Please run 'git init' first."
    exit 1
fi

print_status "Git repository detected"

# Check if GitHub CLI is available (optional)
if command -v gh &> /dev/null; then
    print_status "GitHub CLI detected"
    GH_CLI_AVAILABLE=true
else
    print_warning "GitHub CLI not found. Manual setup will be required."
    GH_CLI_AVAILABLE=false
fi

# Validate required files
echo ""
echo "📋 Validating files..."

required_files=("index.html" "styles.css" "404.html" "_config.yml" ".github/workflows/deploy.yml")
for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        print_status "$file exists"
    else
        print_error "$file is missing"
        exit 1
    fi
done

# Check git status
echo ""
echo "📊 Checking git status..."

if [ -n "$(git status --porcelain)" ]; then
    print_warning "You have uncommitted changes"
    echo ""
    git status --short
    echo ""
    read -p "Do you want to commit these changes? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        git add .
        read -p "Enter commit message (or press Enter for default): " commit_message
        if [ -z "$commit_message" ]; then
            commit_message="Deploy maintenance page"
        fi
        git commit -m "$commit_message"
        print_status "Changes committed"
    else
        print_warning "Proceeding with uncommitted changes"
    fi
else
    print_status "Working directory is clean"
fi

# Check if remote origin exists
if git remote get-url origin &> /dev/null; then
    REMOTE_URL=$(git remote get-url origin)
    print_status "Remote origin: $REMOTE_URL"
else
    print_warning "No remote origin configured"
    echo ""
    read -p "Enter your GitHub repository URL (https://github.com/username/repo.git): " repo_url
    if [ -n "$repo_url" ]; then
        git remote add origin "$repo_url"
        print_status "Remote origin added: $repo_url"
    else
        print_error "Repository URL is required"
        exit 1
    fi
fi

# Push to GitHub
echo ""
echo "📤 Pushing to GitHub..."

current_branch=$(git branch --show-current)
print_info "Current branch: $current_branch"

if [ "$current_branch" != "main" ] && [ "$current_branch" != "master" ]; then
    print_warning "You're not on main/master branch"
    read -p "Do you want to push to '$current_branch' anyway? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        print_info "Please switch to main or master branch and run again"
        exit 1
    fi
fi

git push -u origin "$current_branch"
print_status "Code pushed to GitHub"

# GitHub Pages setup instructions
echo ""
echo "🌐 GitHub Pages Setup"
echo "===================="

if [ "$GH_CLI_AVAILABLE" = true ]; then
    print_info "Attempting to enable GitHub Pages automatically..."
    
    # Try to enable GitHub Pages using GitHub CLI
    if gh api repos/:owner/:repo/pages -X POST -f source.branch="$current_branch" -f source.path="/" &> /dev/null; then
        print_status "GitHub Pages enabled automatically"
    else
        print_warning "Could not enable GitHub Pages automatically"
        print_info "Please enable manually (instructions below)"
    fi
else
    print_info "Manual GitHub Pages setup required"
fi

echo ""
echo "📋 Manual Setup Instructions:"
echo "1. Go to your GitHub repository"
echo "2. Click on 'Settings' tab"
echo "3. Scroll down to 'Pages' section"
echo "4. Under 'Source', select 'Deploy from a branch'"
echo "5. Choose branch: $current_branch"
echo "6. Choose folder: / (root)"
echo "7. Click 'Save'"

# Custom domain setup
echo ""
echo "🌍 Custom Domain Setup"
echo "====================="

if [ -f "CNAME" ]; then
    domain=$(cat CNAME)
    print_info "Custom domain configured: $domain"
    echo ""
    echo "📋 DNS Configuration:"
    echo "1. Add a CNAME record in your DNS settings:"
    echo "   Name: maintenance (or your subdomain)"
    echo "   Value: yourusername.github.io"
    echo ""
    echo "2. Or add A records pointing to GitHub Pages IPs:"
    echo "   185.199.108.153"
    echo "   185.199.109.153"
    echo "   185.199.110.153"
    echo "   185.199.111.153"
else
    print_info "No custom domain configured"
    echo "Your site will be available at: https://yourusername.github.io/mtc-redirect"
fi

# Final instructions
echo ""
echo "🎉 Deployment Complete!"
echo "======================"
print_status "All files have been pushed to GitHub"
print_status "GitHub Actions will automatically deploy your site"
print_info "Check the 'Actions' tab in your GitHub repository for deployment status"

echo ""
echo "📝 Next Steps:"
echo "1. Wait for GitHub Actions to complete (usually 1-2 minutes)"
echo "2. Visit your GitHub Pages URL to verify the site is working"
echo "3. If using a custom domain, configure your DNS settings"
echo "4. Test the maintenance page on different devices"
echo "5. Update your main domain's DNS to point to the maintenance page when ready"

echo ""
echo "🔗 Useful Links:"
echo "• Repository: $(git remote get-url origin)"
echo "• Actions: $(git remote get-url origin | sed 's/\.git$//')/actions"
echo "• Settings: $(git remote get-url origin | sed 's/\.git$//')/settings/pages"

echo ""
print_status "Deployment script completed successfully!"
