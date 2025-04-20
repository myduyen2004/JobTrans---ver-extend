
    document.addEventListener('DOMContentLoaded', function() {
    // Cấu hình gradient
    var ctx2 = document.getElementById("chart-line").getContext("2d");

    var gradientStroke1 = ctx2.createLinearGradient(0, 230, 0, 50);
    gradientStroke1.addColorStop(1, 'rgba(101, 132, 250, 0.2)');
    gradientStroke1.addColorStop(0.2, 'rgba(101, 132, 250, 0.0)');
    gradientStroke1.addColorStop(0, 'rgba(101, 132, 250, 0)');

    var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);
    gradientStroke2.addColorStop(1, 'rgba(21, 32, 112, 0.2)');
    gradientStroke2.addColorStop(0.2, 'rgba(21, 32, 112, 0.0)');
    gradientStroke2.addColorStop(0, 'rgba(21, 32, 112, 0)');

    // Dữ liệu cho 5 năm gần nhất
        document.addEventListener('DOMContentLoaded', function() {
            var ctx2 = document.getElementById("chart-line").getContext("2d");
            let jobStatsChartLast5Years; // Biến để lưu trữ instance biểu đồ

            // Cấu hình gradient (giữ nguyên)
            var gradientStroke1 = ctx2.createLinearGradient(0, 230, 0, 50);
            gradientStroke1.addColorStop(1, 'rgba(101, 132, 250, 0.2)');
            gradientStroke1.addColorStop(0.2, 'rgba(101, 132, 250, 0.0)');
            gradientStroke1.addColorStop(0, 'rgba(101, 132, 250, 0)');

            var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);
            gradientStroke2.addColorStop(1, 'rgba(21, 32, 112, 0.2)');
            gradientStroke2.addColorStop(0.2, 'rgba(21, 32, 112, 0.0)');
            gradientStroke2.addColorStop(0, 'rgba(21, 32, 112, 0)');

            // Hàm để lấy dữ liệu 5 năm gần nhất từ API
            function fetchJobStatsLast5Years() {
                fetch('/JobTrans/JobsByYears') // Sử dụng endpoint JobsByYears
                    .then(response => response.json())
                    .then(dataFromServer => {
                        // Giả định dữ liệu trả về có dạng:
                        // [
                        //   { year: 2021, totalJobs: 3000, completedJobs: 1800, postedJobs: 2500 },
                        //   { year: 2022, totalJobs: 4000, completedJobs: 2400, postedJobs: 3200 },
                        //   { year: 2023, totalJobs: 5000, completedJobs: 3000, postedJobs: 3800 },
                        //   { year: 2024, totalJobs: 5800, completedJobs: 3500, postedJobs: 4200 },
                        //   { year: 2025, totalJobs: 6200, completedJobs: 3700, postedJobs: 4400 }
                        // ]

                        const labels = dataFromServer.map(item => item.year);
                        const postedData = dataFromServer.map(item => item.postedJobs);
                        const completedData = dataFromServer.map(item => item.completedJobs);

                        const chartData = {
                            labels: labels,
                            datasets: [{
                                label: "Công việc đăng tải",
                                tension: 0.4,
                                borderWidth: 0,
                                pointRadius: 5,
                                pointBackgroundColor: "#6584fa",
                                pointBorderColor: "transparent",
                                borderColor: "#6584fa",
                                borderWidth: 3,
                                backgroundColor: gradientStroke1,
                                fill: true,
                                data: postedData,
                                maxBarThickness: 6
                            },
                                {
                                    label: "Công việc hoàn thành",
                                    tension: 0.4,
                                    borderWidth: 0,
                                    pointRadius: 5,
                                    pointBackgroundColor: "#152070",
                                    pointBorderColor: "transparent",
                                    borderColor: "#152070",
                                    borderWidth: 3,
                                    backgroundColor: gradientStroke2,
                                    fill: true,
                                    data: completedData,
                                    maxBarThickness: 6
                                }]
                        };

                        if (jobStatsChartLast5Years) {
                            jobStatsChartLast5Years.data = chartData;
                            jobStatsChartLast5Years.update();
                        } else {
                            jobStatsChartLast5Years = new Chart(ctx2, {
                                type: "line",
                                data: chartData,
                                options: {
                                    responsive: true,
                                    maintainAspectRatio: false,
                                    plugins: {
                                        legend: {
                                            display: true,
                                            position: 'top',
                                            labels: {
                                                font: {
                                                    family: "Inter"
                                                }
                                            }
                                        },
                                        tooltip: {
                                            callbacks: {
                                                label: function(context) {
                                                    let label = context.dataset.label || '';
                                                    if (label) {
                                                        label += ': ';
                                                    }
                                                    label += context.parsed.y;
                                                    return label;
                                                }
                                            }
                                        }
                                    },
                                    interaction: {
                                        intersect: false,
                                        mode: 'index',
                                    },
                                    scales: {
                                        y: {
                                            grid: {
                                                drawBorder: false,
                                                display: true,
                                                drawOnChartArea: true,
                                                drawTicks: false,
                                                borderDash: [5, 5]
                                            },
                                            ticks: {
                                                display: true,
                                                padding: 10,
                                                color: '#b2b9bf',
                                                font: {
                                                    size: 11,
                                                    family: "Inter",
                                                    style: 'normal',
                                                    lineHeight: 2
                                                },
                                            }
                                        },
                                        x: {
                                            grid: {
                                                drawBorder: false,
                                                display: false,
                                                drawOnChartArea: false,
                                                drawTicks: false,
                                                borderDash: [5, 5]
                                            },
                                            ticks: {
                                                display: true,
                                                color: '#b2b9bf',
                                                padding: 20,
                                                font: {
                                                    size: 11,
                                                    family: "Inter",
                                                    style: 'normal',
                                                    lineHeight: 2
                                                },
                                            }
                                        },
                                    },
                                },
                            });
                        }
                    })
                    .catch(error => {
                        console.error("Lỗi khi tải dữ liệu thống kê công việc 5 năm:", error);
                    });
            }

            // Gọi hàm fetch dữ liệu khi trang tải
            fetchJobStatsLast5Years();
        });});

    document.addEventListener('DOMContentLoaded', function() {
        // Lấy context của canvas biểu đồ công việc
        const ctx = document.getElementById('jobStatsChart').getContext('2d');
        let jobChart; // Biến để lưu trữ instance biểu đồ công việc

        // Lấy tham chiếu đến các nút chuyển đổi chế độ xem
        const viewDailyButton = document.getElementById('viewDaily');
        const viewMonthlyButton = document.getElementById('viewMonthly');

        // Cấu hình chung cho biểu đồ
        const chartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    position: 'top',
                    labels: {
                        font: {
                            family: 'Inter'
                        }
                    }
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    grid: {
                        color: 'rgba(0, 0, 0, 0.05)'
                    },
                    ticks: {
                        font: {
                            family: 'Inter'
                        }
                    }
                },
                x: {
                    grid: {
                        display: false
                    },
                    ticks: {
                        font: {
                            family: 'Inter'
                        }
                    }
                }
            }
        };

        // Hàm để tạo datasets cho biểu đồ
        function createDatasets(data) {
            return [{
                label: 'Công việc đăng tải',
                data: data.postedJobs,
                borderColor: '#6584fa',
                backgroundColor: 'rgba(101, 132, 250, 0.1)',
                fill: true,
                tension: 0.4,
                pointRadius: 4,
                pointBackgroundColor: '#6584fa'
            }, {
                label: 'Công việc hoàn thành',
                data: data.completedJobs,
                borderColor: '#152070',
                backgroundColor: 'rgba(21, 32, 112, 0.1)',
                fill: true,
                tension: 0.4,
                pointRadius: 4,
                pointBackgroundColor: '#152070'
            }];
        }

        // Hàm để lấy dữ liệu từ Servlet và cập nhật biểu đồ
        function fetchJobData(url, label) {
            fetch(url)
                .then(response => {

                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    return response.json();
                })
                .then(dataFromServer => {
                    console.log("Dữ liệu trả về từ /JobTrans/JobByDays:", dataFromServer); // Thêm dòng này

                    let labels = [];
                    let postedJobsData = [];
                    let completedJobsData = [];

                    if (url === '/JobTrans/JobByDays') { // Dữ liệu hàng ngày
                        labels = dataFromServer.map(item => {
                            const date = new Date(item.job_date);
                            const dayOfWeek = date.getDay(); // 0: Chủ Nhật, 1: Thứ Hai, ..., 6: Thứ Bảy
                            switch (dayOfWeek) {
                                case 0: return 'Chủ Nhật';
                                case 1: return 'Thứ Hai';
                                case 2: return 'Thứ Ba';
                                case 3: return 'Thứ Tư';
                                case 4: return 'Thứ Năm';
                                case 5: return 'Thứ Sáu';
                                case 6: return 'Thứ Bảy';
                                default: return '';
                            }
                        });
                        postedJobsData = dataFromServer.map(item => item.postedJobs);
                        completedJobsData = dataFromServer.map(item => item.completedJobs);
                    }
                    else if (url === '/JobTrans/JobByMonths') { // Dữ liệu hàng tháng
                        labels = dataFromServer.map(item => {
                            const monthLabel = `Tháng ${item.job_month}`;
                            console.log("Giá trị job_month:", item.job_month);
                            console.log("Label tháng:", monthLabel);
                            return monthLabel;
                        });
                        postedJobsData = dataFromServer.map(item => item.postedJobs);
                        completedJobsData = dataFromServer.map(item => item.completedJobs);
                    }
                    const chartData = {
                        labels: labels,
                        datasets: createDatasets({ postedJobs: postedJobsData, completedJobs: completedJobsData })
                    };

                    if (jobChart) {
                        jobChart.data = chartData;
                        jobChart.update();
                    } else {
                        jobChart = new Chart(ctx, {
                            type: 'line',
                            data: chartData,
                            options: chartOptions
                        });
                    }
                })
                .catch(error => {
                    console.error(`Lỗi khi lấy dữ liệu (${label}):`, error);
                });
        }

        // Hàm để cập nhật trạng thái active của nút
        function updateActiveButton(activeButton) {
            viewDailyButton.classList.remove('active');
            viewMonthlyButton.classList.remove('active');
            activeButton.classList.add('active');
        }

        // Gọi hàm fetch dữ liệu khi trang tải (dữ liệu mặc định là hàng ngày) và set active cho nút mặc định
        fetchJobData('/JobTrans/JobByDays', 'Công việc theo ngày');
        updateActiveButton(viewDailyButton); // Mặc định active nút "Theo ngày"

        // Xử lý sự kiện chuyển đổi chế độ xem
        viewDailyButton.addEventListener('click', function() {
            fetchJobData('/JobTrans/JobByDays', 'Công việc theo ngày'); // Gọi endpoint hàng ngày
            updateActiveButton(viewDailyButton);
        });

        viewMonthlyButton.addEventListener('click', function() {
            fetchJobData('/JobTrans/JobByMonths', 'Công việc theo tháng'); // Gọi endpoint hàng tháng
            updateActiveButton(viewMonthlyButton);
        });

        // Phần mã cho biểu đồ JobsByYears (vẫn giữ nguyên nếu bạn muốn hiển thị nó)
        var ctx2 = document.getElementById("jobsByYearsChart").getContext("2d");
        let jobStatsChartLast5Years;

        var gradientStroke1 = ctx2.createLinearGradient(0, 230, 0, 50);
        gradientStroke1.addColorStop(1, 'rgba(101, 132, 250, 0.2)');
        gradientStroke1.addColorStop(0.2, 'rgba(101, 132, 250, 0.0)');
        gradientStroke1.addColorStop(0, 'rgba(101, 132, 250, 0)');

        var gradientStroke2 = ctx2.createLinearGradient(0, 230, 0, 50);
        gradientStroke2.addColorStop(1, 'rgba(21, 32, 112, 0.2)');
        gradientStroke2.addColorStop(0.2, 'rgba(21, 32, 112, 0.0)');
        gradientStroke2.addColorStop(0, 'rgba(21, 32, 112, 0)');

        function fetchJobStatsLast5Years() {
            fetch('/JobTrans/JobsByYears')
                .then(response => response.json())
                .then(dataFromServer => {
                    const labels = dataFromServer.map(item => item.year);
                    const postedData = dataFromServer.map(item => item.postedJobs);
                    const completedData = dataFromServer.map(item => item.completedJobs);

                    const chartData = {
                        labels: labels,
                        datasets: [{
                            label: "Công việc đăng tải",
                            tension: 0.4,
                            borderWidth: 0,
                            pointRadius: 5,
                            pointBackgroundColor: "#6584fa",
                            pointBorderColor: "transparent",
                            borderColor: "#6584fa",
                            borderWidth: 3,
                            backgroundColor: gradientStroke1,
                            fill: true,
                            data: postedData,
                            maxBarThickness: 6
                        },
                            {
                                label: "Công việc hoàn thành",
                                tension: 0.4,
                                borderWidth: 0,
                                pointRadius: 5,
                                pointBackgroundColor: "#152070",
                                pointBorderColor: "transparent",
                                borderColor: "#152070",
                                borderWidth: 3,
                                backgroundColor: gradientStroke2,
                                fill: true,
                                data: completedData,
                                maxBarThickness: 6
                            }]
                    };

                    if (jobStatsChartLast5Years) {
                        jobStatsChartLast5Years.data = chartData;
                        jobStatsChartLast5Years.update();
                    } else {
                        jobStatsChartLast5Years = new Chart(ctx2, {
                            type: "line",
                            data: chartData,
                            options: {
                                responsive: true,
                                maintainAspectRatio: false,
                                plugins: {
                                    legend: {
                                        display: true,
                                        position: 'top',
                                        labels: {
                                            font: {
                                                family: "Inter"
                                            }
                                        }
                                    },
                                    tooltip: {
                                        callbacks: {
                                            label: function(context) {
                                                let label = context.dataset.label || '';
                                                if (label) {
                                                    label += ': ';
                                                }
                                                label += context.parsed.y;
                                                return label;
                                            }
                                        }
                                    }
                                },
                                interaction: {
                                    intersect: false,
                                    mode: 'index',
                                },
                                scales: {
                                    y: {
                                        grid: {
                                            drawBorder: false,
                                            display: true,
                                            drawOnChartArea: true,
                                            drawTicks: false,
                                            borderDash: [5, 5]
                                        },
                                        ticks: {
                                            display: true,
                                            padding: 10,
                                            color: '#b2b9bf',
                                            font: {
                                                size: 11,
                                                family: "Inter",
                                                style: 'normal',
                                                lineHeight: 2
                                            },
                                        }
                                    },
                                    x: {
                                        grid: {
                                            drawBorder: false,
                                            display: false,
                                            drawOnChartArea: false,
                                            drawTicks: false,
                                            borderDash: [5, 5]
                                        },
                                        ticks: {
                                            display: true,
                                            color: '#b2b9bf',
                                            padding: 20,
                                            font: {
                                                size: 11,
                                                family: "Inter",
                                                style: 'normal',
                                                lineHeight: 2
                                            },
                                        }
                                    },
                                },
                            },
                        });
                    }
                })
                .catch(error => {
                    console.error("Lỗi khi tải dữ liệu thống kê công việc 5 năm:", error);
                });
        }

        fetchJobStatsLast5Years();
    });
    document.addEventListener('DOMContentLoaded', function() {
        // Lấy tham chiếu đến canvas biểu đồ
        const ctx = document.getElementById('revenueChart').getContext('2d');
        let revenueChart; // Biến để lưu trữ instance biểu đồ

        // Lấy tham chiếu đến các nút chuyển đổi chế độ xem
        const viewDailyRevenueButton = document.getElementById('viewDailyRevenue');
        const viewMonthlyRevenueButton = document.getElementById('viewMonthlyRevenue');

        // Cấu hình chung cho biểu đồ
        const chartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    grid: {
                        color: 'rgba(0, 0, 0, 0.05)'
                    },
                    ticks: {
                        callback: function(value) {
                            return value.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
                        },
                        font: {
                            family: 'Inter'
                        }
                    }
                },
                x: {
                    grid: {
                        display: false
                    },
                    ticks: {
                        font: {
                            family: 'Inter',
                            size: 12
                        },
                        color: '#666',
                        padding: 10,
                        maxRotation: 45,  // Góc xoay tối đa cho nhãn
                        minRotation: 0    // Góc xoay tối thiểu cho nhãn
                    },
                    border: {
                        color: 'rgba(0, 0, 0, 0.1)'
                    },
                    title: {
                        display: true,
                        text: 'Thời gian',  // Thay đổi theo nội dung thực tế của bạn
                        font: {
                            family: 'Inter',
                            size: 14,
                            weight: 'bold'
                        },
                        padding: {
                            top: 10
                        }
                    }
                }
            }        };

        // Hàm để lấy dữ liệu từ Servlet và cập nhật biểu đồ
        function fetchRevenueData(url, label) {
            fetch(url)
                .then(response => {
                    if (!response.ok) {
                        throw new Error(`HTTP error! status: ${response.status}`);
                    }
                    return response.json();
                })
                .then(dataFromServer => {
                    let labels = [];
                    let revenueData = [];

                    if (url === '/JobTrans/WeeklyRevenue') { // Dữ liệu hàng tuần
                        labels = dataFromServer.map(item => {
                            if (item.day === 'Mon') return 'Thứ 2';
                            if (item.day === 'Tue') return 'Thứ 3';
                            if (item.day === 'Wed') return 'Thứ 4';
                            if (item.day === 'Thu') return 'Thứ 5';
                            if (item.day === 'Fri') return 'Thứ 6';
                            if (item.day === 'Sat') return 'Thứ 7';
                            if (item.day === 'Sun') return 'Chủ Nhật';
                            return item.day;
                        });
                        revenueData = dataFromServer.map(item => item.revenue);
                    } else if (url === '/JobTrans/MonthlyRevenue') { // Dữ liệu hàng tháng
                        labels = dataFromServer.map(item => `Tháng ${item.month}`); // Giả sử server trả về 'month'
                        revenueData = dataFromServer.map(item => item.monthly_revenue); // Giả sử server trả về 'totalRevenue'
                    }

                    const chartData = {
                        labels: labels,
                        datasets: [{
                            label: label,
                            data: revenueData,
                            borderColor: '#6584fa',
                            backgroundColor: 'rgba(101, 132, 250, 0.1)',
                            fill: true,
                            tension: 0.4,
                            pointRadius: 4,
                            pointBackgroundColor: '#6584fa'
                        }]
                    };

                    if (revenueChart) {
                        revenueChart.data = chartData;
                        revenueChart.options.plugins.legend.display = label !== 'Doanh thu tuần';
                        revenueChart.update();
                    } else {
                        revenueChart = new Chart(ctx, {
                            type: 'line',
                            data: chartData,
                            options: chartOptions
                        });
                    }
                })
                .catch(error => {
                    console.error(`Lỗi khi lấy dữ liệu (${label}):`, error);
                });
        }

        // Hàm để cập nhật trạng thái active của nút
        function updateActiveButton(activeButton) {
            viewDailyRevenueButton.classList.remove('active');
            viewMonthlyRevenueButton.classList.remove('active');
            activeButton.classList.add('active');
        }

        // Gọi hàm fetch dữ liệu khi trang tải (dữ liệu mặc định là hàng tuần) và set active cho nút mặc định
        fetchRevenueData('/JobTrans/WeeklyRevenue', 'Doanh thu tuần');
        updateActiveButton(viewDailyRevenueButton); // Mặc định active nút "Theo ngày"

        // Xử lý sự kiện chuyển đổi chế độ xem
        viewDailyRevenueButton.addEventListener('click', function() {
            fetchRevenueData('/JobTrans/WeeklyRevenue', 'Doanh thu theo tuần'); // Gọi endpoint hàng tuần
            updateActiveButton(viewDailyRevenueButton);
        });

        viewMonthlyRevenueButton.addEventListener('click', function() {
            fetchRevenueData('/JobTrans/MonthlyRevenue', 'Doanh thu theo tháng'); // Gọi endpoint hàng tháng
            updateActiveButton(viewMonthlyRevenueButton);
        });
    });
    // Functions for report interactions
    function viewReportDetails(reportId) {
    console.log('Viewing report details for:', reportId);
    // Implement actual view functionality here
    // For example, redirect to report page or show modal
    alert('Viewing details for ' + reportId);
}

    function viewAllReports() {
    console.log('Viewing all reports');
    // Implement actual view all functionality here
    // For example, redirect to reports page
    alert('Redirecting to all reports page');
}

    // Add click event listeners to table rows
    document.querySelectorAll('tbody tr').forEach(row => {
    row.addEventListener('click', function() {
        const page = this.getAttribute('data-page');
        if (page) {
            console.log('Navigating to:', page);
            // Uncomment this to actually navigate
            // window.location.href = page;
            alert('Navigating to ' + page);
        }
    });
});

    // Initialize tooltips and popovers
    var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
    var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
});

    var popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'))
    var popoverList = popoverTriggerList.map(function (popoverTriggerEl) {
    return new bootstrap.Popover(popoverTriggerEl)
});


    // Transaction filter functionality
    function filterTransactions(period) {
    let filterText = '';

    switch(period) {
    case 'today':
    filterText = 'Hiển thị giao dịch hôm nay';
    // Here you would normally filter the actual data
    break;
    case 'yesterday':
    filterText = 'Hiển thị giao dịch hôm qua';
    break;
    case 'week':
    filterText = 'Hiển thị giao dịch tuần này';
    break;
    case 'month':
    filterText = 'Hiển thị giao dịch tháng này';
    break;
    case 'all':
    filterText = 'Hiển thị tất cả giao dịch';
    break;
}

    document.getElementById('transactionFilterText').innerHTML =
    `<i class="fa fa-calendar text-jobtrans" aria-hidden="true"></i>
     <span class="font-weight-bold ms-1">${filterText}</span>`;

    // In a real application, this would refresh the table data based on the filter
    console.log('Filtering transactions for period:', period);
}

    // Initialize Transaction Stats Chart
    document.addEventListener('DOMContentLoaded', function() {
    var transactionCtx = document.getElementById('transactionStatsChart').getContext('2d');

    // Create gradient for the chart
    var gradientStroke = transactionCtx.createLinearGradient(0, 230, 0, 50);
    gradientStroke.addColorStop(1, 'rgba(101, 132, 250, 0.2)');
    gradientStroke.addColorStop(0.2, 'rgba(72, 72, 176, 0.0)');
    gradientStroke.addColorStop(0, 'rgba(101, 132, 250, 0)');

    new Chart(transactionCtx, {
    type: 'line',
    data: {
    labels: ['08/04', '09/04', '10/04', '11/04', '12/04', '13/04'],
    datasets: [{
    label: 'Số lượng giao dịch',
    tension: 0.4,
    borderWidth: 3,
    pointRadius: 4,
    borderColor: '#6584fa',
    backgroundColor: gradientStroke,
    fill: true,
    data: [42, 38, 45, 50, 58, 55],
    maxBarThickness: 6
}]
},
    options: {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
    legend: {
    display: false,
}
},
    interaction: {
    intersect: false,
    mode: 'index',
},
    scales: {
    y: {
    beginAtZero: true,
    grid: {
    color: 'rgba(0, 0, 0, 0.05)'
},
    ticks: {
    font: {
    family: 'Inter'
}
}
},
    x: {
    grid: {
    display: false
},
    ticks: {
    font: {
    family: 'Inter'
}
}
}
}
}
});
});
    function updateProgressBar(selector, percentage) {
    const progressBar = document.querySelector(selector);
    if (progressBar) {
    progressBar.style.width = percentage + '%';
    progressBar.setAttribute('aria-valuenow', percentage);

    // Add percentage text inside if it doesn't exist
    if (!progressBar.querySelector('span') && percentage > 15) {
    const percentText = document.createElement('span');
    percentText.textContent = percentage + '%';
    progressBar.appendChild(percentText);
} else if (progressBar.querySelector('span')) {
    progressBar.querySelector('span').textContent = percentage + '%';
}
}
}
    // Example usage with a selector
    updateProgressBar('.progress-bar', 75); // Updates all progress bars
    // Or for a specific progress bar
    updateProgressBar('#specific-progress .progress-bar', 60);
