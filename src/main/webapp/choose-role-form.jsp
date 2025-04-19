<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chọn Vai Trò</title>
    <!-- Using Font Awesome from CDN for better reliability -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="css/choose-role-form.css">
</head>
<body>
<div class="particles" id="particles"></div>


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
        const particleCount = 30;ô
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