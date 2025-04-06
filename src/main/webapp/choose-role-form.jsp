<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chọn Vai Trò</title>
    <!-- Using Font Awesome from CDN for better reliability -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        :root {
            --primary-color: #3f51b5;
            --primary-light: #5c6bc0;
            --primary-dark: #0d1b6a;
            --accent-color: #ff4081;
            --text-color: #ffffff;
            --shadow-color: rgba(0, 0, 0, 0.3);
            --glow-color: rgba(255, 255, 255, 0.5);
            --card-bg: rgba(255, 255, 255, 0.1);
            --card-hover-bg: rgba(255, 255, 255, 0.15);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, var(--primary-dark), #1a237e, #283593);
            background-size: 400% 400%;
            animation: gradientBG 15s ease infinite;
            color: var(--text-color);
            text-align: center;
            margin: 0;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            position: relative;
        }

        @keyframes gradientBG {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .particles {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        }

        .particle {
            position: absolute;
            background-color: white;
            border-radius: 50%;
            opacity: 0.3;
            animation: float 15s infinite ease-in-out;
        }

        @keyframes float {
            0% { transform: translateY(0) translateX(0); }
            25% { transform: translateY(-20px) translateX(10px); }
            50% { transform: translateY(0) translateX(20px); }
            75% { transform: translateY(20px) translateX(10px); }
            100% { transform: translateY(0) translateX(0); }
        }

        .logo {
            width: 150px;
            height: auto;
            position: absolute;
            top: 50px;
            left: 50%;
            transform: translateX(-50%);
            animation: pulse 3s infinite;
            z-index: 2;
            filter: drop-shadow(0 0 8px var(--glow-color));
        }

        @keyframes pulse {
            0% { transform: translateX(-50%) scale(1); }
            50% { transform: translateX(-50%) scale(1.05); }
            100% { transform: translateX(-50%) scale(1); }
        }

        .container {
            transition: transform 0.8s cubic-bezier(0.68, -0.55, 0.27, 1.55);
            background: var(--card-bg);
            padding: 40px;
            border-radius: 20px;
            box-shadow: 0 8px 32px 0 var(--shadow-color);
            backdrop-filter: blur(8px);
            border: 1px solid rgba(255, 255, 255, 0.18);
            max-width: 500px;
            width: 90%;
            z-index: 1;
        }

        .slide-left {
            transform: translateX(-150%);
        }

        h2 {
            font-size: 32px;
            margin-bottom: 30px;
            text-transform: uppercase;
            letter-spacing: 2px;
            font-weight: 600;
            text-shadow: 0 2px 5px rgba(0, 0, 0, 0.3);
            position: relative;
            display: inline-block;
        }

        h2:after {
            content: '';
            position: absolute;
            width: 60%;
            height: 3px;
            background: var(--accent-color);
            bottom: -10px;
            left: 20%;
            border-radius: 3px;
        }

        .roles {
            display: flex;
            gap: 30px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .role {
            padding: 25px 40px;
            border-radius: 15px;
            background: var(--primary-color);
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            gap: 15px;
            color: white;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            font-size: 18px;
            width: 180px;
            position: relative;
            overflow: hidden;
        }

        .role:before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: linear-gradient(45deg, transparent, rgba(255, 255, 255, 0.1), transparent);
            transform: translateX(-100%);
            transition: 0.6s;
        }

        .role:hover:before {
            transform: translateX(100%);
        }

        .role:hover {
            background: var(--primary-light);
            transform: translateY(-10px) scale(1.05);
            box-shadow: 0 15px 30px var(--shadow-color),
            0 0 20px var(--glow-color);
        }

        .role:active {
            transform: translateY(0) scale(0.95);
        }

        .role i {
            font-size: 40px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            padding: 15px;
            transition: 0.3s;
        }

        .role:hover i {
            transform: rotateY(180deg);
            color: var(--accent-color);
        }

        .role h3 {
            font-size: 20px;
            margin: 0;
            font-weight: 500;
            letter-spacing: 1px;
        }

        .footer {
            position: absolute;
            bottom: 30px;
            color: var(--text-color);
            font-size: 14px;
            opacity: 0.8;
            z-index: 1;
            letter-spacing: 1px;
        }

        @media (max-width: 600px) {
            .roles {
                flex-direction: column;
                gap: 20px;
            }

            .role {
                width: 100%;
            }

            h2 {
                font-size: 24px;
            }

            .container {
                padding: 25px;
            }
        }
    </style>
</head>
<body>
<div class="particles" id="particles"></div>

<img style="width: 100px" src="wp-content/uploads/2021/09/logo.png" alt="Logo" class="logo">

<div class="container">
    <h2>Chọn vai trò của bạn</h2>
    <div class="roles">
        <div class="role" onclick="selectRole('Individual')">
            <i class="fas fa-user-circle"></i>
            <h3>Cá nhân</h3>
        </div>
        <div class="role" onclick="selectRole('Group')">
            <i class="fas fa-users"></i>
            <h3>Nhóm</h3>
        </div>
    </div>
</div>

<div class="footer">&copy; JobTrans 2025 - Tất cả các quyền được bảo lưu</div>

<script>
    // Create floating particles
    function createParticles() {
        const particles = document.getElementById('particles');
        const particleCount = 30;

        for (let i = 0; i < particleCount; i++) {
            const particle = document.createElement('div');
            particle.classList.add('particle');

            // Random position
            const posX = Math.random() * 100;
            const posY = Math.random() * 100;

            // Random size
            const size = Math.random() * 8 + 2;

            // Random animation delay
            const delay = Math.random() * 15;

            // Apply styles
            particle.style.left = `${posX}%`;
            particle.style.top = `${posY}%`;
            particle.style.width = `${size}px`;
            particle.style.height = `${size}px`;
            particle.style.animationDelay = `${delay}s`;

            particles.appendChild(particle);
        }
    }

    // Function to handle role selection
    function selectRole(role) {
        const container = document.querySelector('.container');
        container.classList.add('slide-left');

        // Add ripple effect to clicked role
        const roles = document.querySelectorAll('.role');
        roles.forEach(roleEl => {
            if (roleEl.querySelector('h3').textContent.toLowerCase().includes(role)) {
                roleEl.style.background = 'var(--accent-color)';
            }
        });

        setTimeout(() => {
            // window.location.href = `role?role='+ role+'&action=choose`;
            window.location.href = 'type?type=' + role + '&action=choose';
        }, 800);
    }

    // Initialize on page load
    document.addEventListener('DOMContentLoaded', function() {
        createParticles();

        // Add hover sound effect
        const roles = document.querySelectorAll('.role');
        roles.forEach(role => {
            role.addEventListener('mouseenter', () => {
                // You could add sound effect here if desired
            });
        });
    });
</script>
</body>
</html>