(function($) {
    "use strict";

    // select2
    $('.multiple-select').select2({
        tags: true
    });

    // Sidebar menu open
    $('.feds-menu ul li').on('click', function() {
        $(".feds-menu ul li").removeClass("open");
        $(this).addClass("open");
    });


    // My Account menu button
    $(function() {
        $('.my-account-button,.notifications-button').on('click', function(event) {
            event.preventDefault();

            const dropdown = $(this).closest('.my-account-widget,.notifications-widget');

            if (dropdown.is('.open')) {
                dropdown.removeClass('open');
            } else {
                dropdown.addClass('open');
            }
        });

        $(document).on('click', function(event) {
            $('.my-account-widget,.notifications-widget')
                .not($(event.target).closest('.my-account-widget,.notifications-widget'))
                .removeClass('open');
        });
    });

    // Delete image
    function deleteAttachment() {
        $('.delete-attachment').on('click', function(event) {
            event.preventDefault();

            $('#create-project-form,#create-service-form').addClass('processing-loader');
            $(this).parent().parent().hide();

            if ($('.attachment-ids').val()) {
                var ids = JSON.parse($('.attachment-ids').val());
                var removeItem = $(this).attr('data-attachment-id');
                ids = $.grep(ids, function(value) {
                    return value != removeItem;
                });
                $('.attachment-ids').val('[' + ids + ']');
            }

            $.ajax({
                url: prolancerAjaxUrlObj.ajaxurl,
                type: 'POST',
                data: {
                    action: 'prolancer_ajax_delete_attachment',
                    nonce: $(this).attr('data-nonce'),
                    service_id: $(this).attr('data-service-id'),
                    project_id: $(this).attr('data-project-id'),
                    attachment_id: $(this).attr('data-attachment-id')
                },
                success: function(response) {
                    if (response.success == true) {
                        Swal.fire({
                            icon: 'success',
                            title: response.data.message
                        });
                        $('#create-project-form,#create-service-form').removeClass('processing-loader');
                    } else {
                        Swal.fire({
                            icon: 'error',
                            title: response.data.message
                        });
                    }
                }
            });
        });
    }
    deleteAttachment();


    // Create Project
    $('#create-project').on('click', function(event) {
        $('#create-project-form').addClass('processing-loader');
        event.preventDefault();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_create_project',
                project_id: $(this).attr('data-project-id'),
                nonce: $(this).attr('data-nonce'),
                project_data: $("form#create-project-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    $('#create-project-form').removeClass('processing-loader');
                    window.location = response.data.redirect_url;
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });

                    if (response.data.redirect_url) {
                        window.location = response.data.redirect_url;
                    }
                }
            }
        });
    });

    // Choose Project type 
    function project_type() {
        if ($('[name=project_type] option:selected').val() == 'Hourly') {
            $('[name=project_type]').parent().removeClass('col-md-6').addClass('col-md-12');
            $('[name=estimated_hours]').parent().show();
        } else {
            $('[name=estimated_hours]').parent().hide();
        }

        $('#create-project-form [name=project_type]').on('change', function() {
            if (this.value == 'Fixed') {
                $('[name=project_type]').parent().removeClass('col-md-12').addClass('col-md-6');
                $('[name=estimated_hours]').parent().hide('slow');
            } else {
                $('[name=project_type]').parent().removeClass('col-md-6').addClass('col-md-12');
                $('[name=estimated_hours]').parent().show('slow');
            }
        });
    }
    project_type();


    // Upload project image
    $('#upload-project-attachments').on('change', function() {

        $('#create-project-form').addClass('processing-loader');

        var file_obj = $(this).prop('files');
        var form_data = new FormData();

        for (var i = 0; i < file_obj.length; i++) {
            form_data.append('attachments[]', file_obj[i]);
        }

        form_data.append('project_id', $(this).attr('data-project-id'));
        form_data.append('action', 'prolancer_ajax_upload_project_attachments');
        form_data.append('nonce', $(this).attr('data-nonce'));

        $('.append-images .preload').show();

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            contentType: false,
            processData: false,
            data: form_data,
            success: function(response) {
                if (response.success == true) {
                    $('.attachment-ids').val(response.data.ids);
                    $('.append-images').append(response.data.attachments);
                    $('.append-images .preload').hide();
                    deleteAttachment();
                    $('#create-project-form').removeClass('processing-loader');
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }

        });

    });

    // Delete Project
    $('.delete-project').on('click', function(event) {
        event.preventDefault();
        $(this).hide();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_delete_project',
                project_id: $(this).attr('data-project-id'),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    window.location = response.data.redirect_url
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });


    // Create Service
    $('#create-service').on('click', function(event) {
        $('#create-service-form').addClass('processing-loader');
        event.preventDefault();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_create_service',
                service_id: $(this).attr('data-service-id'),
                nonce: $(this).attr('data-nonce'),
                service_data: $("form#create-service-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    $('#create-service-form').removeClass('processing-loader');
                    window.location = response.data.redirect_url;
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });

                    if (response.data.redirect_url) {
                        window.location = response.data.redirect_url;
                    }
                }
            }
        });
    });


    // Upload service image
    $('#upload-service-attachments').on('change', function() {

        $('#create-service-form').addClass('processing-loader');

        var file_obj = $(this).prop('files');
        var form_data = new FormData();

        for (var i = 0; i < file_obj.length; i++) {
            form_data.append('attachments[]', file_obj[i]);
        }

        form_data.append('service_id', $(this).attr('data-service-id'));
        form_data.append('action', 'prolancer_ajax_upload_service_attachments');
        form_data.append('nonce', $(this).attr('data-nonce'));

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            contentType: false,
            processData: false,
            data: form_data,
            success: function(response) {
                if (response) {
                    $('.attachment-ids').val(response.data.ids);
                    $('.append-images').append(response.data.attachments);
                    $('.append-images .preload').hide();
                    deleteAttachment();
                    $('#create-service-form').removeClass('processing-loader');
                } else {
                    alert('Error');
                }
            }
        });
    });

    // Delete Service
    $('.delete-service').on('click', function(event) {
        event.preventDefault();
        $(this).hide();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_delete_service',
                service_id: $(this).attr('data-service-id'),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    window.location = response.data.redirect_url
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });


    // Update Buyer Profile
    $('#update-buyer-profile').on('click', function(event) {
        event.preventDefault();
        $('#buyer-profile-form').addClass('processing-loader');
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_update_buyer_profile',
                buyer_id: $(this).attr('data-buyer-id'),
                nonce: $(this).attr('data-nonce'),
                buyer_data: $("form#buyer-profile-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    $('#buyer-profile-form').removeClass('processing-loader');
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    location.reload();
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });


    // Update seller Profile
    $('#update-seller-profile').on('click', function(event) {
        event.preventDefault();

        $('#seller-profile-form').addClass('processing-loader');

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_update_seller_profile',
                seller_id: $(this).attr('data-seller-id'),
                nonce: $(this).attr('data-nonce'),
                seller_data: $("form#seller-profile-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    $('#seller-profile-form').removeClass('processing-loader');
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    location.reload();
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Recharge Wallet
    $('#wallet-recharge').on('click', function(event) {
        event.preventDefault();
        $(this).hide();
        $('#wallet-recharge-form').addClass('processing-loader');

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_wallet_recharge',
                nonce: $(this).attr('data-nonce'),
                wallet_data: $("form#wallet-recharge-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    window.location = response.data.redirect_url;
                    $('#wallet-recharge-form').removeClass('processing-loader');
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Submit Proposal
    $('.submit-proposal').on('click', function(event) {
        event.preventDefault();
        var preloader = $(this).parent();
        preloader.addClass('processing-loader');

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_submit_proposal',
                nonce: $(this).attr('data-nonce'),
                project_id: $(this).attr('data-project-id'),
                proposal_data: $("form#proposal-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    window.location = response.data.redirect_url
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });

                    preloader.removeClass('processing-loader');
                }
            }
        });
    });

    // Order Service
    $('.order-service').on('click', function(event) {
        event.preventDefault();
        $(this).hide();
        var parent = $(this).parent().parent();
        parent.addClass('processing-loader');

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_order_service',
                nonce: $(this).attr('data-nonce'),
                service_id: $(this).attr('data-service-id'),
                package_id: $(this).attr('data-package-id'),
                additional_service_ids: $(this).attr('data-additional-service-ids')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    window.location = response.data.redirect_url
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    }).then(function() {
                        window.location = response.data.redirect_url;
                    });

                    parent.removeClass('processing-loader');
                }
            }
        });
    });

    // Send service message
    $('.send-service-message').on('click', function(event) {
        event.preventDefault();

        $('#send-service-message-form').addClass('processing-loader');

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_send_service_message',
                nonce: $(this).attr('data-nonce'),
                sender_id: $(this).attr('data-sender-id'),
                receiver_id: $(this).attr('data-receiver-id'),
                order_id: $(this).attr('data-order-id'),
                message_data: $("form#send-service-message-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    $('#send-service-message-form').removeClass('processing-loader');
                    location.reload();
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Send project message
    $('.send-project-message').on('click', function(event) {
        event.preventDefault();

        $('#send-project-message-form').addClass('processing-loader');

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_send_project_message',
                nonce: $(this).attr('data-nonce'),
                sender_id: $(this).attr('data-sender-id'),
                receiver_id: $(this).attr('data-receiver-id'),
                proposal_id: $(this).attr('data-proposal-id'),
                message_data: $("form#send-project-message-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    $('#send-project-message-form').removeClass('processing-loader');
                    location.reload();
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Service order complete
    $('#service-order-complete').on('click', function(event) {
        event.preventDefault();
        $(this).hide();

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_service_order_complete',
                nonce: $(this).attr('data-nonce'),
                seller_id: $(this).attr('data-seller-id'),
                order_id: $(this).attr('data-order-id'),
                review_data: $("form#review-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    window.location = response.data.redirect_url
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Service order cancel
    $('#service-order-cancel').on('click', function(e) {
        e.preventDefault();
        $(this).hide();

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_service_order_cancel',
                nonce: $(this).attr('data-nonce'),
                seller_id: $(this).attr('data-seller-id'),
                order_id: $(this).attr('data-order-id')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    window.location = response.data.redirect_url
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Hire seller
    $('.hire-seller').on('click', function(event) {
        event.preventDefault();
        $(this).hide();

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_hire_seller',
                nonce: $(this).attr('data-nonce'),
                project_id: $(this).attr('data-project-id'),
                buyer_id: $(this).attr('data-buyer-id'),
                seller_id: $(this).attr('data-seller-id'),
                proposal_id: $(this).attr('data-proposal-id')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    window.location = response.data.redirect_url
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    }).then(function() {
                        window.location = response.data.redirect_url;
                    });
                }
            }
        });
    });

    // Project proposal cancel
    $('.project-proposal-cancel').on('click', function(event) {
        event.preventDefault();
        $(this).hide();

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_proposal_cancel',
                nonce: $(this).attr('data-nonce'),
                project_id: $(this).attr('data-project-id'),
                buyer_id: $(this).attr('data-buyer-id'),
                seller_id: $(this).attr('data-seller-id'),
                proposal_id: $(this).attr('data-proposal-id')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    window.location = response.data.redirect_url
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Project cancel
    $('#project-cancel').on('click', function(event) {
        event.preventDefault();
        $(this).hide();
        
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_project_cancel',
                nonce: $(this).attr('data-nonce'),
                project_id: $(this).attr('data-project-id'),
                buyer_id: $(this).attr('data-buyer-id'),
                seller_id: $(this).attr('data-seller-id'),
                proposal_id: $(this).attr('data-proposal-id')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    window.location = response.data.redirect_url
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Project complete
    $('#project-complete').on('click', function(event) {
        event.preventDefault();
        $(this).hide();
        
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_project_complete',
                nonce: $(this).attr('data-nonce'),
                seller_id: $(this).attr('data-seller-id'),
                proposal_id: $(this).attr('data-proposal-id'),
                review_data: $("form#review-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    window.location = response.data.redirect_url
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });


    // Upload message attachment
    $('#upload-message-attachments').on('change', function() {

        $('#send-project-message-form,#send-service-message-form').addClass('processing-loader');

        var file_obj = $(this).prop('files');
        var form_data = new FormData();

        form_data.append('post_id', $(this).attr('data-post-id'));
        form_data.append('attachment', file_obj[0]);
        form_data.append('action', 'prolancer_ajax_upload_message_attachment');
        form_data.append('nonce', $(this).attr('data-nonce'));

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            contentType: false,
            processData: false,
            data: form_data,
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    $('.attachment-id').val(response.data.id);
                    $('#send-project-message-form,#send-service-message-form').removeClass('processing-loader');
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }

        });

    });


    // Save payment methods
    $('#save-payout-methods').on('click', function(event) {
        event.preventDefault();
        $('#payout-form').addClass('processing-loader');
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_payout_methods',
                nonce: $(this).attr('data-nonce'),
                payout_data: $("form#payout-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    location.reload(true);
                    $('#payout-form').removeClass('processing-loader');
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });


    // Register submit
    $('#register-submit').on('click', function(event) {
        event.preventDefault();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_register',
                nonce: $(this).attr('data-nonce'),
                register_data: $("form#register-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    $('#register-form').addClass('processing-loader');
                    $('#register-submit').hide();
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    location.reload(true);
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });


    // Login submit
    $('#login-submit').on('click', function(event) {
        event.preventDefault();
        $('#login-form').addClass('processing-loader');
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_login',
                nonce: $(this).attr('data-nonce'),
                login_data: $("form#login-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    $('#login-form').addClass('processing-loader');
                    $('#login-submit').hide();
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    window.location = response.data.redirect_url;
                } else {
                    $('#login-form').removeClass('processing-loader');
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Profile switcher
    $('.profile-switcher').on('click', function(event) {
        event.preventDefault();
        $('.frontend-dashboard').addClass('processing-loader');
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_profile_switcher',
                nonce: $(this).attr('data-nonce'),
                visit_as: $(this).attr('data-visit-as')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    location.reload();
                }
            }
        });
    });


    // Withdrawal request
    $('#withdrawal-request').on('click', function(event) {
        event.preventDefault();

        $('#withdrawal-form').addClass('processing-loader');

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_withdrawal_request',
                nonce: $(this).attr('data-nonce'),
                withdraw_data: $("form#withdrawal-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    location.reload(true);
                    $('#withdrawal-form').removeClass('processing-loader');
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                    location.reload(true);
                }
            }
        });
    });

    // Verification
    $('#submit-verification').on('click', function(event) {
        event.preventDefault();

        $('#verification-form').addClass('processing-loader');

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_verification',
                nonce: $(this).attr('data-nonce'),
                verification_data: $("form#verification-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    location.reload(true);
                    $('#verification-form').removeClass('processing-loader');
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                    $('#verification-form').removeClass('processing-loader');
                }
            }
        });
    });


    // Open Dispute
    $('#open-dispute').on('click', function(event) {
        event.preventDefault();

        $('#disputes-form').addClass('processing-loader');

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_open_dispute',
                nonce: $(this).attr('data-nonce'),
                disputes_data: $("form#disputes-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    location.reload(true);
                    $('#disputes-form').removeClass('processing-loader');
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Change password
    $('#change-password').on('click', function(event) {
        event.preventDefault();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_change_password',
                user_id: $(this).attr('data-user-id'),
                password_data: $("form#password-form").serialize(),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    location.reload(true);
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Delete Account
    $('#delete-account').on('click', function(event) {
        event.preventDefault();
        $(this).hide();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_delete_account',
                user_id: $(this).attr('data-user-id'),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response.success == true) {
                    if (response.data.message == 'Administrator cannot be deleted') {
                        Swal.fire({
                            icon: 'error',
                            title: response.data.message
                        });
                    } else {
                        Swal.fire({
                            icon: 'success',
                            title: response.data.message
                        });
                    }
                    window.location = response.data.redirect_url
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Project search
    $('#project-search-form').on('change', function(event) {
        $('.search-result').addClass('processing-loader');
        event.preventDefault();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'GET',
            data: {
                action: 'prolancer_project_ajax_search_form',
                nonce: $(this).attr('data-nonce'),
                search_data: $("form#project-search-form").serialize()
            },
            success: function(response) {
                if (response) {
                    $('.search-result').removeClass('processing-loader');
                    $('.search-result').html(response);
                } else {
                    alert('Error');
                }
            }
        });
    });

    // Service search
    $('#service-search-form').on('change', function(event) {
        $('.search-result').addClass('processing-loader');
        event.preventDefault();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'GET',
            data: {
                action: 'prolancer_service_ajax_search_form',
                nonce: $(this).attr('data-nonce'),
                search_data: $("form#service-search-form").serialize()
            },
            success: function(response) {
                // Slick RTL Support
                function rtl_slick() {
                    if ($('body').hasClass("rtl")) {
                        return true;
                    } else {
                        return false;
                    }
                }

                if (response) {
                    $('.search-result').removeClass('processing-loader');
                    $('.search-result').html(response);
                    $('.service-item-images').slick({
                        arrows: false,
                        infinite: true,
                        dots: true,
                        rtl: rtl_slick(),
                        slidesToShow: 1,
                        slidesToScroll: 1
                    });
                } else {
                    alert('Error');
                }
            }
        });
    });

    // Buyer search
    $('#buyer-search-form').on('change', function(event) {
        $('.search-result').addClass('processing-loader');
        event.preventDefault();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'GET',
            data: {
                action: 'prolancer_buyer_ajax_search_form',
                nonce: $(this).attr('data-nonce'),
                search_data: $("form#buyer-search-form").serialize()
            },
            success: function(response) {
                if (response) {
                    $('.search-result').removeClass('processing-loader');
                    $('.search-result').html(response);
                } else {
                    alert('Error');
                }
            }
        });
    });

    // Seller search
    $('#seller-search-form').on('change', function(event) {
        $('.search-result').addClass('processing-loader');
        event.preventDefault();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'GET',
            data: {
                action: 'prolancer_seller_ajax_search_form',
                nonce: $(this).attr('data-nonce'),
                search_data: $("form#seller-search-form").serialize()
            },
            success: function(response) {
                if (response) {
                    $('.search-result').removeClass('processing-loader');
                    $('.search-result').html(response);
                } else {
                    alert('Error');
                }
            }
        });
    });


    $(".rating-stars").rating({
        "click": function(e) {
            var stars = e.stars;
            $("#rating-stars").val(stars);
        }

    });

    // Chart
    google.charts.load('current', { 'packages': ['corechart'] });
    google.charts.setOnLoadCallback(drawChart);


    function drawChart() {
        var data = new google.visualization.DataTable();

        data.addColumn('string', 'Date');
        data.addColumn('number', 'Views');

        if (typeof prolancer_buyers_views !== 'undefined') {
            $.each(prolancer_buyers_views.data, function(index, el) {
                data.addRows([
                    [index, parseInt(el)]
                ]);
            });
        }

        if (typeof prolancer_sellers_views !== 'undefined') {
            $.each(prolancer_sellers_views.data, function(index, el) {
                data.addRows([
                    [index, parseInt(el)]
                ]);
            });
        }

        var options = {
            legend: {
                position: 'none'
            },
            chartArea: {
                top: 20,
                bottom: 30,
                width: '100%'
            },
            'height': 500
        };

        var curve_chart = $('#curve_chart');

        if (curve_chart.length) {
            var chart = new google.visualization.AreaChart(curve_chart[0]);
            chart.draw(data, options);
        }

    }

    // Add skill
    $('.add-new-skill').on('click', function(e) {
        e.preventDefault();
        $(this).attr("disabled", "disabled").button('refresh');
        $(this).prepend("<i class='fal fa-spinner-third fa-spin'></i>");
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_get_skills_list',
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response) {
                    $('.skills').append(response);
                    $('.fa-spinner-third').remove();
                    $('.add-new-skill').removeAttr("disabled").button('refresh');
                    $('.skills .fa-trash,.skills .dashicons-trash').on('click', function() {
                        $(this).parent().parent().remove();
                    });
                } else {
                    alert('Error');
                }
            }
        });
    });

    // Remove skill
    $('.skills .fa-trash,.skills .dashicons-trash').on('click', function() {
        $(this).parent().parent().remove();
    });

    // Add FAQ
    $('.add-new-faq').on('click', function(e) {
        e.preventDefault();
        $(this).attr("disabled", "disabled").button('refresh');
        $(this).prepend("<i class='fal fa-spinner-third fa-spin'></i>");
        $('.faqs').append(`
            <div class="row mb-4">
                <div class="col-sm-1">
                    <i class="fa fa-bars"></i>
                </div>
                <div class="col-sm-10 my-auto">
                    <input type="text" name='faq_title[]' class="form-control" placeholder="Title">
                    <textarea name='faq_description[]' class="form-control" placeholder="Description"></textarea>
                </div>
                <div class="col-sm-1">
                    <i class="fas fa-trash"></i>
                </div>
            </div>
        `);
        $('.fa-spinner-third').remove();
        $('.add-new-faq').removeAttr("disabled").button('refresh');
        $('.faqs .fa-trash').on('click', function() {
            $(this).parent().parent().remove();
        });
    });

    // Remove FAQ
    $('.faqs .fa-trash').on('click', function() {
        $(this).parent().parent().remove();
    });

    // Add Additional Service
    $('.add-additional-service').on('click', function(e) {
        e.preventDefault();
        $(this).attr("disabled", "disabled").button('refresh');
        $(this).prepend("<i class='fal fa-spinner-third fa-spin'></i>");
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_get_additional_service',
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response) {
                    $('.additional-services').append(response);
                    $('.fa-spinner-third').remove();
                    $('.add-additional-service').removeAttr("disabled").button('refresh');
                    $('.additional-services .fa-trash,.additional-services .dashicons-trash').on('click', function() {
                        $(this).parent().parent().remove();
                    });
                } else {
                    alert('Error');
                }
            }
        });
    });

    // Remove Additional Service
    $('.additional-services .fa-trash,.additional-services .dashicons-trash').on('click', function() {
        $(this).parent().parent().remove();
    });

    // Sortable 
    $(".sortable ").sortable();

    // Get additional service price add to the main service
    $('.additional-service-item input').on('click', function() {
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_get_additional_service_price',
                nonce: $(this).attr('data-nonce'),
                service_id: $(this).attr('data-service-id'),
                additional_service_data: $("form#additional-service-form").serialize()
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });

                    $.each($(".price"), function(i, e) {
                        $(this).find('span').html(parseInt($(this).attr('data-price'), 10) + response.data.total_price);
                    });

                    $.each($('.order-service'), function() {
                        $(this).attr('data-additional-service-ids', response.data.additional_service_ids);
                    });

                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });


    // Follow Buyers
    $('.follow-buyer').on('click', function(e) {
        e.preventDefault();

        $(this).attr("disabled", "disabled").button('refresh');
        $(this).find('.fa-user-plus').addClass("fa-spinner-third fa-spin").removeClass('fa-user-plus');

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_follow_buyer',
                post_id: $(this).attr('data-id'),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });

                    $('.fa-spinner-third').addClass("fa-user-check").removeClass('fa-spinner-third fa-spin');
                    $('.follow-buyer span').text('Following');
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });                    

                    location.reload(true);
                }
            }
        });
    });

    // Remove Following Buyer
    $('.remove-follow-buyer').on('click', function(e) {
        e.preventDefault();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_remove_following_buyer',
                post_id: $(this).attr('data-id'),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });

                    location.reload(true);
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Follow Sellers
    $('.follow-seller').on('click', function(e) {
        e.preventDefault();

        $(this).attr("disabled", "disabled").button('refresh');
        $(this).find('.fa-user-plus').addClass("fa-spinner-third fa-spin").removeClass('fa-user-plus');

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_follow_seller',
                post_id: $(this).attr('data-id'),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });

                    $('.fa-spinner-third').addClass("fa-user-check").removeClass('fa-spinner-third fa-spin');
                    $('.follow-seller span').text('Following');
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });

                    location.reload(true);
                }
            }
        });
    });

    // Remove Following Seller
    $('.remove-follow-seller').on('click', function(e) {
        e.preventDefault();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_remove_following_seller',
                post_id: $(this).attr('data-id'),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });

                    location.reload(true);
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Wishlist Projects
    $('.wishlist-project').on('click', function(e) {
        e.preventDefault();

        $(this).attr("disabled", "disabled").button('refresh');
        $(this).find('.fa-heart').addClass("fa-spinner-third fa-spin").removeClass('fa-heart');

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_wishlist_project',
                post_id: $(this).attr('data-id'),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });

                    $('.fa-spinner-third').addClass("fa-check-circle").removeClass('fa-spinner-third fa-spin');
                    $('.wishlist-project span').text('Wishlisted');
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });

                    location.reload(true);
                }
            }
        });
    });

    // Remove Wishlist Project
    $('.remove-wishlist-project').on('click', function(e) {
        e.preventDefault();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_remove_wishlist_project',
                post_id: $(this).attr('data-id'),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });

                    location.reload(true);
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Wishlist Services
    $('.wishlist-service').on('click', function(e) {
        e.preventDefault();

        $(this).attr("disabled", "disabled").button('refresh');
        $(this).find('.fa-heart').addClass("fa-spinner-third fa-spin").removeClass('fa-heart');

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_wishlist_service',
                post_id: $(this).attr('data-id'),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });

                    $('.fa-spinner-third').addClass("fas fa-heart").removeClass('fa-spinner-third fa-spin');
                    $('.wishlist-service span').text('Wishlisted');
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });

                    location.reload(true);
                }
            }
        });
    });

    // Remove Wishlist Service
    $('.remove-wishlist-service').on('click', function(e) {
        e.preventDefault();
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_remove_wishlist_service',
                post_id: $(this).attr('data-id'),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    
                    location.reload(true);
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Send Message
    $('.send-message').on('click', function(e) {
        e.preventDefault();
        $(this).attr("disabled", "disabled").button('refresh');
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_messages',
                receiver_id: $(this).attr('data-receiver-id'),
                sender_id: $(this).attr('data-sender-id'),
                message_data: $(this).parents('form:first').serialize(),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {
                if (response.success == true) {
                    Swal.fire({
                        icon: 'success',
                        title: response.data.message
                    });
                    location.reload(true);
                } else {
                    Swal.fire({
                        icon: 'error',
                        title: response.data.message
                    });
                }
            }
        });
    });

    // Notification clicked
    $('.notifications-content li a').on('click', function(e) {
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_notification_clicked',
                notification_id: $(this).attr('data-id'),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {}
        });
    });

    // Message notification clicked
    $('.notifications-content.message li a').on('click', function(e) {
        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: {
                action: 'prolancer_ajax_message_notification_clicked',
                notification_id: $(this).attr('data-id'),
                nonce: $(this).attr('data-nonce')
            },
            success: function(response) {}
        });
    });

    // Package feature select
    $(".packages input[type='checkbox']").on('click', function() {
        if ($(this).next().val() == 'yes') {
            $(this).next().val('no');
        } else {
            $(this).next().val('yes');
        }
    });

    // File Upload
    function ajax_file_upload(file, className, postId, inputName, nonce) {
        var bar = $(className).find('.progress-bar');

        var file_data = new FormData();
        if (file) {
            file_data.append('action', 'prolancer_ajax_upload_file');
            file_data.append('nonce', nonce);
            file_data.append('file', file);
            file_data.append('post_id', postId);
        }

        $.ajax({
            url: prolancerAjaxUrlObj.ajaxurl,
            type: 'POST',
            data: file_data,
            cache: false,
            contentType: false,
            processData: false,
            xhr: function() {
                var xhr = new window.XMLHttpRequest();
                xhr.upload.addEventListener("progress", function(evt) {
                    if (evt.lengthComputable) {
                        var percentComplete = Math.round(((evt.loaded / evt.total) * 100));
                        bar.width(percentComplete + '%');
                        bar.html(percentComplete + '%');
                    }
                }, false);
                return xhr;
            },
            beforeSend: function() {
                $(className).find('.progress').show();
            },
            success: function(response) {
                var validVideoTypes = ['video/mp4', 'video/mpg', 'video/avi', 'video/m4v'];
                var validImageTypes = ['image/jpeg', 'image/png'];

                if (validVideoTypes.includes(response.data.type)) {

                    $('<video />', {
                        src: response.data.video,
                        type: response.data.type,
                        width: '100%',
                        controls: true
                    }).appendTo(className);

                    $('<input>').attr({
                        value: response.data.id,
                        type: 'hidden',
                        name: inputName,
                    }).appendTo(className);

                    $(className).find('.progress').hide();

                    $(className).removeClass('dropzone').addClass('dropcomplete');

                } else if (validImageTypes.includes(response.data.type)) {

                    $(className).append(response.data.image);
                    $(className).find('.progress').hide();

                    $('<input>').attr({
                        value: response.data.id,
                        type: 'hidden',
                        name: inputName,
                    }).appendTo(className);

                    $(className).removeClass('dropzone').addClass('dropcomplete');
                }
            }
        });
    }

    //Upload file
    $('.upload-file').on('change', function(e) {
        var file = this.files[0];
        var validVideoTypes = ['video/mp4', 'video/mpg', 'video/avi', 'video/m4v'];
        var validImageTypes = ['image/jpeg', 'image/png'];
        if (validImageTypes.includes(file['type'])) {
            ajax_file_upload(
                file,
                $(this).parent('.dropzone'),
                $(this).attr('data-post-id'),
                $(this).attr('data-name'),
                $(this).attr('data-nonce')
            );
        } else {
            alert('Invalid file type');
        }

    });

    // Drag and drop
    var file = false;
    $('.dropzone').on('drag dragstart dragend dragover dragenter dragleave drop', function(e) {
        e.preventDefault();
        e.stopPropagation();
    }).on('dragover dragenter', function() {
        $(this).addClass('is-dragover');
    }).on('dragleave dragend drop', function() {
        $(this).removeClass('is-dragover');
    }).on('drop', function(e) {
        file = e.originalEvent.dataTransfer.files[0];

        var validVideoTypes = ['video/mp4', 'video/mpg', 'video/avi', 'video/m4v'];
        var validImageTypes = ['image/jpeg', 'image/png'];

        if (validImageTypes.includes(file['type'])) {
            ajax_file_upload(
                file,
                $(this),
                $(this).attr('data-post-id'),
                $(this).attr('data-name'),
                $(this).attr('data-nonce')
            );
        } else if (validVideoTypes.includes(file['type'])) {

        } else {
            alert('Invalid file type');
        }
    });

    // Dispute product price
    $('select[name=dispute-id]').on('change', function(e) {
        e.preventDefault();
        $('input[name=amount]').val($(this).find(':selected').data('price'));
    });

})(jQuery);