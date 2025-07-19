# More Than Certified - Maintenance Page

A stylish, responsive maintenance page for More Than Certified, designed to match the brand's visual identity and provide a professional experience during planned downtime.

## 🎨 Design Features

- **Brand Consistency**: Follows the official MTC style guide with signature cyan-to-purple gradient
- **Responsive Design**: Optimized for all devices from mobile to desktop
- **Dark Mode Support**: Automatically adapts to user's system preference
- **Accessibility**: WCAG compliant with proper contrast ratios and keyboard navigation
- **Animated Elements**: Subtle floating icons and smooth transitions
- **Professional Layout**: Clean, modern design that maintains brand trust

## 🚀 Features

### Visual Elements
- **Brand Logo**: Animated graduation cap icon with MTC gradient
- **Status Indicator**: Live maintenance status with pulsing animation
- **Feature Preview**: Showcase of platform capabilities
- **Contact Options**: Direct links to support and community
- **Social Links**: Professional social media presence

### Technical Features
- **Static HTML/CSS**: No build process required, works with GitHub Pages
- **SEO Optimized**: Proper meta tags and structured data
- **Performance**: Optimized loading with CDN resources
- **Error Handling**: Custom 404 page with auto-redirect
- **Search Engine Control**: Robots.txt to prevent indexing during maintenance

## 📁 File Structure

```
mtc-redirect/
├── index.html          # Main maintenance page
├── styles.css          # MTC brand-compliant styles
├── 404.html           # Custom error page
├── robots.txt         # Search engine directives
├── CNAME              # Custom domain configuration
├── _config.yml        # GitHub Pages configuration
├── .github/
│   └── workflows/
│       └── deploy.yml # Automated deployment
└── README.md          # This file
```

## 🎯 Brand Colors

The page uses the official More Than Certified color palette:

- **Primary Gradient**: `#00CED1` (Cyan) → `#8A2BE2` (Purple)
- **Accent Color**: `#FF00FF` (Fuchsia)
- **Status Colors**: Teal for success, Pink for errors
- **Neutral Colors**: Responsive light/dark mode support

## 🛠️ Deployment

### Automatic Deployment (Recommended)

1. **Push to GitHub**: Any push to `main` or `master` branch triggers deployment
2. **GitHub Actions**: Automated workflow builds and deploys to GitHub Pages
3. **Custom Domain**: Configured for `maintenance.morethancertified.com`

### Manual Setup

1. **Enable GitHub Pages**:
   - Go to repository Settings → Pages
   - Source: Deploy from a branch
   - Branch: `main` / `master`
   - Folder: `/` (root)

2. **Custom Domain** (Optional):
   - Update `CNAME` file with your domain
   - Configure DNS to point to GitHub Pages

## 🔧 Customization

### Update Contact Information

Edit `index.html` and `404.html`:

```html
<!-- Email Support -->
<a href="mailto:support@morethancertified.com" class="contact-link">

<!-- Discord Link -->
<a href="https://discord.gg/your-discord" class="contact-link">

<!-- Social Media Links -->
<a href="https://twitter.com/morethancert" class="social-link">
<a href="https://linkedin.com/company/morethancertified" class="social-link">
<a href="https://github.com/morethancertified" class="social-link">
```

### Modify Maintenance Message

Update the maintenance description in `index.html`:

```html
<p class="maintenance-description">
  Your custom maintenance message here...
</p>
```

### Enable Auto-Refresh

Uncomment the auto-refresh script in `index.html` to check for maintenance completion:

```html
<script>
  // Refresh page every 5 minutes
  setTimeout(() => {
    window.location.reload();
  }, 300000);
</script>
```

### Custom Domain

Update `CNAME` file with your domain:

```
your-domain.com
```

## 📱 Responsive Breakpoints

- **Mobile**: `< 480px` - Optimized for small screens
- **Tablet**: `481px - 768px` - Touch-friendly interface
- **Desktop**: `> 768px` - Full-featured layout
- **Large Desktop**: `> 1280px` - Enhanced spacing

## ♿ Accessibility Features

- **Semantic HTML**: Proper heading hierarchy and landmarks
- **ARIA Labels**: Screen reader friendly
- **Keyboard Navigation**: Full keyboard accessibility
- **Color Contrast**: WCAG AA compliant ratios
- **Reduced Motion**: Respects user preferences
- **Focus Indicators**: Clear focus states for all interactive elements

## 🔍 SEO Configuration

- **Meta Tags**: Comprehensive meta information
- **Open Graph**: Social media sharing optimization
- **Structured Data**: Search engine friendly markup
- **Robots.txt**: Prevents indexing during maintenance
- **Sitemap**: Automatic generation via Jekyll

## 🚦 Status Codes

- **200 OK**: Main maintenance page
- **404 Not Found**: Custom error page with auto-redirect
- **503 Service Unavailable**: Can be configured at server level

## 📊 Analytics (Optional)

To add Google Analytics, insert before closing `</head>` tag:

```html
<!-- Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

## 🔄 Going Live

1. **Push to GitHub**: Commit and push all changes
2. **Verify Deployment**: Check GitHub Actions for successful deployment
3. **Test Domain**: Verify custom domain is working
4. **Update DNS**: Point your main domain to the maintenance page
5. **Monitor**: Check that the page loads correctly

## 🎉 Post-Maintenance

1. **Remove Maintenance Page**: Delete or rename `index.html`
2. **Update DNS**: Point domain back to main application
3. **Remove Robots.txt**: Allow search engine indexing
4. **Archive Repository**: Keep for future maintenance needs

## 📞 Support

For questions or issues with this maintenance page:

- **Email**: support@morethancertified.com
- **Discord**: [Join our community](https://discord.gg/your-discord)
- **GitHub**: [Open an issue](https://github.com/morethancertified/mtc-redirect/issues)

---

**More Than Certified** - Elevating DevOps professionals through hands-on learning and industry-recognized certifications.

© 2024 More Than Certified. All rights reserved.
