<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Center.login" %>

    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <meta name="description" content="Login to Certaining Partner Portal - Exam Management System" />
        <title>Login | Certaining Partner Portal</title>

        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap"
            rel="stylesheet" />

        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
            crossorigin="anonymous" />

        <!-- Font Awesome 6 -->
        <link rel="stylesheet" href="https://site-assets.fontawesome.com/releases/v6.4.2/css/all.css" />

        <style>
            /* ============================================
           CERTAINING LOGIN — PREMIUM DESIGN
           ============================================ */

            *,
            *::before,
            *::after {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                font-family: 'Inter', -apple-system, BlinkMacSystemFont, sans-serif;
                background: #f0f4f8;
                min-height: 100vh;
                overflow-x: hidden;
            }

            /* ===== MAIN LAYOUT ===== */

            .crt-login-page {
                display: flex;
                min-height: 100vh;
            }

            /* ===== LEFT PANEL — ILLUSTRATION ===== */

            .crt-login-left {
                flex: 1;
                position: relative;
                display: flex;
                align-items: center;
                justify-content: center;
                overflow: hidden;
                background: linear-gradient(160deg, #003d47 0%, #007388 40%, #0099b3 70%, #00b4d8 100%);
            }

            /* Animated gradient overlay */
            .crt-login-left::before {
                content: '';
                position: absolute;
                inset: 0;
                background:
                    radial-gradient(ellipse at 20% 80%, rgba(0, 180, 216, 0.25) 0%, transparent 60%),
                    radial-gradient(ellipse at 80% 20%, rgba(0, 115, 136, 0.3) 0%, transparent 60%);
                z-index: 1;
            }


            /* Floating decorative circles */
            .crt-login-left::after {
                content: '';
                position: absolute;
                width: 500px;
                height: 500px;
                border-radius: 50%;
                background: rgba(255, 255, 255, 0.03);
                top: -100px;
                right: -150px;
                z-index: 1;
            }

            .crt-left-content {
                position: relative;
                z-index: 2;
                text-align: center;
                padding: 40px;
                max-width: 520px;
            }

            .crt-left-content .crt-illustration {
                width: 100%;
                max-width: 380px;
                margin-bottom: 40px;
                filter: drop-shadow(0 20px 40px rgba(0, 0, 0, 0.2));
                animation: floatIllustration 6s ease-in-out infinite;
            }

            @keyframes floatIllustration {

                0%,
                100% {
                    transform: translateY(0);
                }

                50% {
                    transform: translateY(-12px);
                }
            }

            .crt-left-content h2 {
                color: #fff;
                font-size: 28px;
                font-weight: 700;
                margin-bottom: 12px;
                letter-spacing: -0.3px;
            }

            .crt-left-content p {
                color: rgba(255, 255, 255, 0.75);
                font-size: 15px;
                line-height: 1.7;
                max-width: 400px;
                margin: 0 auto;
            }

            /* Floating dots decoration */
            .crt-float-dots {
                position: absolute;
                z-index: 1;
            }

            .crt-float-dots.dot-1 {
                width: 8px;
                height: 8px;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 50%;
                top: 15%;
                left: 10%;
                animation: floatDot 8s infinite ease-in-out;
            }

            .crt-float-dots.dot-2 {
                width: 12px;
                height: 12px;
                background: rgba(255, 255, 255, 0.15);
                border-radius: 50%;
                top: 25%;
                right: 15%;
                animation: floatDot 6s infinite ease-in-out reverse;
            }

            .crt-float-dots.dot-3 {
                width: 6px;
                height: 6px;
                background: rgba(255, 255, 255, 0.25);
                border-radius: 50%;
                bottom: 30%;
                left: 20%;
                animation: floatDot 10s infinite ease-in-out;
            }

            .crt-float-dots.dot-4 {
                width: 14px;
                height: 14px;
                background: rgba(255, 255, 255, 0.08);
                border-radius: 50%;
                bottom: 15%;
                right: 25%;
                animation: floatDot 7s infinite ease-in-out reverse;
            }

            @keyframes floatDot {

                0%,
                100% {
                    transform: translate(0, 0);
                }

                25% {
                    transform: translate(15px, -20px);
                }

                50% {
                    transform: translate(-10px, 15px);
                }

                75% {
                    transform: translate(20px, 10px);
                }
            }

            /* ===== RIGHT PANEL — FORM ===== */

            .crt-login-right {
                flex: 0 0 720px;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 50px 60px;
                background: #fff;
                position: relative;
            }

            /* Subtle wave separator */
            .crt-login-right::before {
                content: '';
                position: absolute;
                left: -30px;
                top: 0;
                bottom: 0;
                width: 60px;
                background: #fff;
                border-radius: 50% 0 0 50% / 5% 0 0 5%;
                z-index: 3;
            }

            /* ===== LOGO ===== */

            .crt-login-logo {
                text-align: center;
                margin-bottom: 10px;
            }

            .crt-login-logo img {
                max-width: 160px;
                margin-bottom: 6px;
            }

            .crt-login-logo .crt-portal-badge {
                display: inline-block;
                background: linear-gradient(135deg, #007388, #0099b3);
                color: #fff;
                font-size: 11px;
                font-weight: 600;
                letter-spacing: 1.5px;
                text-transform: uppercase;
                padding: 4px 14px;
                border-radius: 20px;
                margin-top: 4px;
            }

            /* ===== WELCOME TEXT ===== */

            .crt-login-header {
                text-align: center;
                margin-bottom: 32px;
            }

            .crt-login-header h1 {
                font-size: 26px;
                font-weight: 700;
                color: #1a2332;
                margin-bottom: 6px;
            }

            .crt-login-header p {
                font-size: 14px;
                color: #7a869a;
            }

            /* ===== FORM CARD ===== */

            .crt-login-form-card {
                width: 100%;
                max-width: 400px;
            }

            /* ===== ERROR ALERT ===== */

            .crt-login-form-card .alert-danger {
                background: linear-gradient(135deg, #fff5f5, #ffe3e3);
                border: 1px solid #fecaca;
                border-radius: 12px;
                color: #dc2626;
                font-size: 13px;
                padding: 12px 16px;
                margin-bottom: 20px;
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .crt-login-form-card .alert-danger i {
                font-size: 16px;
                flex-shrink: 0;
            }

            /* ===== INPUT GROUP ===== */

            .crt-input-group {
                position: relative;
                margin-bottom: 20px;
            }

            .crt-input-group label {
                display: block;
                font-size: 13px;
                font-weight: 600;
                color: #374151;
                margin-bottom: 8px;
            }

            .crt-input-wrapper {
                display: flex;
                align-items: center;
                background: #f8fafc;
                border: 2px solid #e2e8f0;
                border-radius: 14px;
                padding: 0 16px;
                transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            }

            .crt-input-wrapper:focus-within {
                border-color: #007388;
                background: #fff;
                box-shadow: 0 0 0 4px rgba(0, 115, 136, 0.08);
            }

            .crt-input-wrapper .crt-input-icon {
                color: #94a3b8;
                font-size: 18px;
                margin-right: 12px;
                transition: color 0.3s ease;
            }

            .crt-input-wrapper:focus-within .crt-input-icon {
                color: #007388;
            }

            .crt-input-wrapper .form-control {
                border: none !important;
                background: transparent !important;
                box-shadow: none !important;
                padding: 14px 0;
                font-size: 14px;
                font-weight: 400;
                color: #1e293b;
                font-family: 'Inter', sans-serif;
            }

            .crt-input-wrapper .form-control::placeholder {
                color: #94a3b8;
                font-weight: 400;
            }

            /* Password toggle */
            .crt-password-toggle {
                background: none;
                border: none;
                color: #94a3b8;
                cursor: pointer;
                padding: 4px;
                font-size: 16px;
                transition: color 0.2s;
            }

            .crt-password-toggle:hover {
                color: #007388;
            }

            /* ===== SIGN IN BUTTON ===== */

            .crt-btn-signin {
                width: 100%;
                padding: 14px 24px;
                background: linear-gradient(135deg, #007388 0%, #0099b3 50%, #007388 100%);
                background-size: 200% auto;
                border: none;
                border-radius: 14px;
                color: #fff;
                font-size: 15px;
                font-weight: 600;
                letter-spacing: 0.5px;
                cursor: pointer;
                transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
                position: relative;
                overflow: hidden;
                margin-top: 8px;
                font-family: 'Inter', sans-serif;
            }

            .crt-btn-signin:hover {
                background-position: right center;
                transform: translateY(-2px);
                box-shadow: 0 8px 25px rgba(0, 115, 136, 0.35);
            }

            .crt-btn-signin:active {
                transform: translateY(0);
            }

            /* Button shimmer effect */
            .crt-btn-signin::after {
                content: '';
                position: absolute;
                top: 0;
                left: -100%;
                width: 100%;
                height: 100%;
                background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.15), transparent);
                transition: left 0.5s ease;
            }

            .crt-btn-signin:hover::after {
                left: 100%;
            }

            /* ===== DIVIDER ===== */

            .crt-divider {
                display: flex;
                align-items: center;
                margin: 24px 0;
                gap: 12px;
            }

            .crt-divider::before,
            .crt-divider::after {
                content: '';
                flex: 1;
                height: 1px;
                background: #e2e8f0;
            }

            .crt-divider span {
                font-size: 12px;
                color: #94a3b8;
                font-weight: 500;
                text-transform: uppercase;
                letter-spacing: 1px;
            }

            /* ===== FOOTER LINKS ===== */

            .crt-login-footer {
                text-align: center;
            }

            .crt-login-footer a {
                color: #007388;
                text-decoration: none;
                font-size: 13px;
                font-weight: 500;
                transition: color 0.2s;
            }

            .crt-login-footer a:hover {
                color: #005a6b;
                text-decoration: underline;
            }

            .crt-login-footer .crt-help-text {
                font-size: 12px;
                color: #94a3b8;
                margin-top: 8px;
            }

            .crt-login-footer .crt-help-text a {
                font-weight: 600;
            }

            /* ===== COPYRIGHT ===== */

            .crt-copyright {
                text-align: center;
                margin-top: 25px;
                font-size: 12px;
                color: #b0bec5;
            }

            /* ===== SECURITY BADGE ===== */

            .crt-security-badge {
                display: flex;
                align-items: center;
                justify-content: center;
                gap: 6px;
                margin-top: 20px;
                font-size: 11px;
                color: #94a3b8;
            }

            .crt-security-badge i {
                font-size: 12px;
                color: #22c55e;
            }

            /* ==============================
           RESPONSIVE DESIGN
           ============================== */

            /* Tablets */
            @media (max-width: 1024px) {
                .crt-login-right {
                    flex: 0 0 460px;
                    padding: 40px 45px;
                }

                .crt-left-content .crt-illustration {
                    max-width: 300px;
                }
            }

            /* Mobile — stack layout */
            @media (max-width: 768px) {
                .crt-login-page {
                    flex-direction: column;
                }

                .crt-login-left {
                    min-height: 220px;
                    padding: 30px 20px;
                }

                .crt-login-left::before,
                .crt-login-left::after,
                .crt-float-dots {
                    display: none;
                }

                .crt-left-content .crt-illustration {
                    max-width: 180px;
                    margin-bottom: 16px;
                }

                .crt-left-content h2 {
                    font-size: 20px;
                    margin-bottom: 6px;
                }

                .crt-left-content p {
                    font-size: 13px;
                    display: none;
                }

                .crt-login-right {
                    flex: 1;
                    padding: 30px 24px 40px;
                }

                .crt-login-right::before {
                    display: none;
                }

                .crt-login-logo img {
                    max-width: 130px;
                }

                .crt-login-header h1 {
                    font-size: 22px;
                }

                .crt-input-wrapper {
                    border-radius: 12px;
                    padding: 0 14px;
                }

                .crt-btn-signin {
                    border-radius: 12px;
                    padding: 13px 20px;
                }
            }

            /* Small phones */
            @media (max-width: 400px) {
                .crt-login-right {
                    padding: 24px 18px 36px;
                }

                .crt-login-header h1 {
                    font-size: 20px;
                }

                .crt-input-wrapper .form-control {
                    padding: 12px 0;
                    font-size: 13px;
                }
            }

            /*         style="background-image: url('./asset/img/login-ele.png')*/
        </style>
    </head>

    <body>
        <div class="crt-login-page">

            <!-- ===== LEFT PANEL — Illustration & Branding ===== -->
            <div class="crt-login-left">



                <!-- Floating decorative dots -->
                <div class="crt-float-dots dot-1"></div>
                <div class="crt-float-dots dot-2"></div>
                <div class="crt-float-dots dot-3"></div>
                <div class="crt-float-dots dot-4"></div>

                <div class="crt-left-content">
                    <!-- SVG Illustration: Secure Login -->
                    <svg class="crt-illustration" viewBox="0 0 500 400" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <!-- Monitor -->
                        <rect x="100" y="60" width="300" height="200" rx="16" fill="rgba(255,255,255,0.12)"
                            stroke="rgba(255,255,255,0.25)" stroke-width="2" />
                        <rect x="120" y="80" width="260" height="160" rx="8" fill="rgba(255,255,255,0.08)" />
                        <!-- Monitor Stand -->
                        <rect x="210" y="260" width="80" height="12" rx="2" fill="rgba(255,255,255,0.15)" />
                        <rect x="185" y="272" width="130" height="8" rx="4" fill="rgba(255,255,255,0.12)" />
                        <!-- Shield Icon on screen -->
                        <path
                            d="M250 110 L290 128 L290 165 C290 190 270 210 250 218 C230 210 210 190 210 165 L210 128 Z"
                            fill="rgba(255,255,255,0.15)" stroke="rgba(255,255,255,0.4)" stroke-width="2" />
                        <!-- Checkmark in shield -->
                        <polyline points="232,158 245,172 270,145" fill="none" stroke="#4ade80" stroke-width="4"
                            stroke-linecap="round" stroke-linejoin="round" />
                        <!-- Login form elements on screen -->
                        <rect x="160" y="190" width="180" height="14" rx="7" fill="rgba(255,255,255,0.1)" />
                        <rect x="160" y="212" width="180" height="14" rx="7" fill="rgba(255,255,255,0.1)" />
                        <!-- User avatar circle -->
                        <circle cx="250" cy="100" r="0" fill="rgba(255,255,255,0.1)" />
                        <!-- Floating elements -->
                        <circle cx="80" cy="120" r="20" fill="rgba(255,255,255,0.06)" stroke="rgba(255,255,255,0.12)"
                            stroke-width="1.5">
                            <animate attributeName="cy" values="120;110;120" dur="4s" repeatCount="indefinite" />
                        </circle>
                        <path d="M70 120 L80 110 L90 120 L80 130 Z" fill="rgba(255,255,255,0.15)">
                            <animate attributeName="opacity" values="0.15;0.3;0.15" dur="4s" repeatCount="indefinite" />
                        </path>
                        <!-- Key icon floating -->
                        <g transform="translate(400, 160)">
                            <animateTransform attributeName="transform" type="translate"
                                values="400,160;400,148;400,160" dur="5s" repeatCount="indefinite" />
                            <circle cx="0" cy="0" r="18" fill="rgba(255,255,255,0.06)" stroke="rgba(255,255,255,0.15)"
                                stroke-width="1.5" />
                            <circle cx="-2" cy="-3" r="5" fill="none" stroke="rgba(255,255,255,0.3)"
                                stroke-width="1.5" />
                            <rect x="-1" y="2" width="3" height="8" rx="1" fill="rgba(255,255,255,0.25)" />
                        </g>
                        <!-- Lock icon floating -->
                        <g transform="translate(400, 90)">
                            <animateTransform attributeName="transform" type="translate" values="400,90;405,78;400,90"
                                dur="6s" repeatCount="indefinite" />
                            <circle cx="0" cy="0" r="15" fill="rgba(255,255,255,0.06)" stroke="rgba(255,255,255,0.12)"
                                stroke-width="1.5" />
                            <rect x="-6" y="-2" width="12" height="9" rx="2" fill="rgba(255,255,255,0.2)" />
                            <path d="M-3 -2 L-3 -6 A3 3 0 0 1 3 -6 L3 -2" fill="none" stroke="rgba(255,255,255,0.3)"
                                stroke-width="1.5" />
                        </g>
                        <!-- Globe floating -->
                        <g transform="translate(90, 240)">
                            <animateTransform attributeName="transform" type="translate" values="90,240;85,230;90,240"
                                dur="7s" repeatCount="indefinite" />
                            <circle cx="0" cy="0" r="16" fill="rgba(255,255,255,0.05)" stroke="rgba(255,255,255,0.15)"
                                stroke-width="1.5" />
                            <ellipse cx="0" cy="0" rx="8" ry="16" fill="none" stroke="rgba(255,255,255,0.12)"
                                stroke-width="1" />
                            <line x1="-16" y1="0" x2="16" y2="0" stroke="rgba(255,255,255,0.1)" stroke-width="1" />
                        </g>
                        <!-- Connection dots/lines -->
                        <line x1="110" y1="120" x2="100" y2="100" stroke="rgba(255,255,255,0.08)" stroke-width="1"
                            stroke-dasharray="3 3" />
                        <line x1="390" y1="160" x2="400" y2="160" stroke="rgba(255,255,255,0.08)" stroke-width="1"
                            stroke-dasharray="3 3" />
                        <line x1="390" y1="100" x2="400" y2="90" stroke="rgba(255,255,255,0.08)" stroke-width="1"
                            stroke-dasharray="3 3" />
                    </svg>

                    <h2>Manage Partner Portal</h2>
                    <p>Manage your test center operations through a secure dashboard. Schedule assessments, monitor
                        candidate activity, and track test sessions efficiently from one centralized platform.</p>
                </div>
            </div>

            <!-- ===== RIGHT PANEL — Login Form ===== -->
            <div class="crt-login-right">

                <!-- Logo -->
                <div class="crt-login-logo">
                    <img src="/asset/img/cert-logo.png" alt="Certaining Logo" />
                    <br />
                    <span class="crt-portal-badge">Welcome to Partner Portal</span>
                </div>

                <!-- Welcome Header -->
                <div class="crt-login-header">
                    <%--<h1>Welcome to Partner Portal</h1>--%>
                        <p>Sign in to access your dashboard</p>
                </div>

                <!-- Login Form -->
                <div class="crt-login-form-card">
                    <form runat="server">

                        <!-- Error Alert -->
                        <div class="alert alert-danger" id="error" runat="server" visible="false">
                            <i class="fa-solid fa-circle-exclamation"></i>
                            <asp:Label ID="lbl_error_login" runat="server" Text="" />
                        </div>

                        <!-- Username Input -->
                        <div class="crt-input-group">
                            <label for="txt_username">Test Center Code</label>
                            <div class="crt-input-wrapper">
                                <i class="fa-solid fa-building crt-input-icon"></i>
                                <asp:TextBox ID="txt_username" runat="server" class="form-control"
                                    placeholder="Enter your center code" autofocus="autofocus" />
                            </div>
                        </div>

                        <!-- Password Input -->
                        <div class="crt-input-group">
                            <label for="txt_password">Password</label>
                            <div class="crt-input-wrapper">
                                <i class="fa-solid fa-lock crt-input-icon"></i>
                                <asp:TextBox ID="txt_password" runat="server" TextMode="Password" class="form-control"
                                    placeholder="Enter your password" />
                                <button type="button" class="crt-password-toggle" onclick="togglePassword()"
                                    aria-label="Toggle password visibility">
                                    <i class="fa-regular fa-eye" id="toggleIcon"></i>
                                </button>
                            </div>
                        </div>

                        <!-- Sign In Button -->
                        <asp:Button ID="btn_Signin" runat="server" Text="SIGN IN" CssClass="crt-btn-signin"
                            OnClick="Login_Check" />

                        <!-- Security Badge -->
                        <div class="crt-security-badge">
                            <i class="fa-solid fa-shield-halved"></i>
                            <span>Protected with 256-bit SSL encryption</span>
                        </div>

                    </form>
                </div>

                <!-- Footer -->
                <div class="crt-login-footer">
                    <div class="crt-help-text">
                        Need assistance? <a href="https://certaining.org/contact-us" target="_blank">Contact Support</a>
                    </div>
                </div>

                <!-- Copyright -->
                <div class="crt-copyright">
                    &copy; <span id="cyValue" style="color:#007388"></span> Certaining. All Rights Reserved.
                </div>

            </div>
        </div>

        <!-- Password Toggle Script -->
        <script>
            function togglePassword() {
                var input = document.querySelector('[id$="txt_password"]');
                var icon = document.getElementById('toggleIcon');
                if (input.type === 'password') {
                    input.type = 'text';
                    icon.className = 'fa-regular fa-eye-slash';
                } else {
                    input.type = 'password';
                    icon.className = 'fa-regular fa-eye';
                }
            }

            const currentDate = new Date();
            const currentYear = currentDate.getFullYear();
            console.log(currentYear, "currentYear");
            document.getElementById('cyValue').innerHTML = currentYear;
        </script>
    </body>

    </html>