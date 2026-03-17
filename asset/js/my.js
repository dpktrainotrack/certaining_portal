$(document).ready(function() {
     
         
            //     $(".mobile-screen-icon").on("click", function() {
            //    f
            //         // $("#mobileMenu").toggleClass("block-menu");
            //         alert("hello");
            //     });
            // });
    
  $("#menu_toggle").click(function() {
      var body = $('body');
      var rightCol = $('.right_col');
      var isNavSm = body.hasClass('nav-sm');
      
      if (isNavSm) {
          // Switching from nav-sm to nav-md
          body.removeClass('nav-sm').addClass('nav-md');
          rightCol.css('min-height', '100vh');
          $(this).removeClass('rotate180');


      } else {
          // Switching from nav-md to nav-sm
          body.removeClass('nav-md').addClass('nav-sm');
          rightCol.css('min-height', 'auto');
          $(this).toggleClass('rotate180');
      }

      // For mobile responsiveness
      if ($(window).width() <= 768) {
          var isMobileMinHeight4599 = rightCol.css('min-height') === 'auto';

          if (isMobileMinHeight4599) {
              rightCol.css('min-height', 'auto');
          } else {
              rightCol.css('min-height', 'auto');
          }
      }
  });
});


// Calender Select Date

const calendarInput = document.getElementById('calendar');

// Initially set a placeholder-like value
function addPlaceholder() {
    if (!calendarInput.value) {
        calendarInput.classList.add('placeholder');
        calendarInput.setAttribute('type', 'text');
        calendarInput.value = "Select a date";
    }
}

// Remove placeholder on focus
function removePlaceholder() {
    if (calendarInput.value === "Select a date") {
        calendarInput.classList.remove('placeholder');
        calendarInput.setAttribute('type', 'date');
        calendarInput.value = "";
    }
}

// Ensure placeholder is shown initially if no date selected
addPlaceholder();


$SIDEBAR_MENU.find('a').on('click', function (ev) {
    var $li = $(this).parent();

    if ($li.is('.active')) {
        $li.removeClass('active active-sm');
        $('ul:first', $li).slideUp(function () {
            setContentHeight();
        });
    } else {
        // prevent closing menu if we are on child menu
        if (!$li.parent().is('.child_menu')) {
            openUpMenu();
        } else {
            if ($BODY.is('nav-sm')) {
                if (!$li.parent().is('child_menu')) {
                    openUpMenu();
                }
            }
        }

        $li.addClass('active');

        $('ul:first', $li).slideDown(function () {
            setContentHeight();
        });
    }
});

document.addEventListener("DOMContentLoaded", function() {
    // Get the exam and amount voucher elements
    var examLink = document.querySelector('.examvoucher');
    var examVoucherDiv = document.querySelector('.examvoucher1');
    
    var amountLink = document.querySelector('.amountvoucher');
    var amountVoucherDiv = document.querySelector('.amountvoucher1');
    
    // Set exam voucher as active (visible) when the page loads
    examVoucherDiv.style.display = "block"; // Make exam voucher visible
    amountVoucherDiv.style.display = "none"; // Ensure amount voucher is hidden

    // Add click event listener for exam voucher link
    examLink.addEventListener('click', function(event) {
        event.preventDefault(); // Prevent default link behavior
        examVoucherDiv.style.display = "block"; // Show exam voucher
        amountVoucherDiv.style.display = "none"; // Hide the amount voucher
    });

    // Add click event listener for amount voucher link
    amountLink.addEventListener('click', function(event) {
        event.preventDefault(); // Prevent default link behavior
        amountVoucherDiv.style.display = "block"; // Show amount voucher
        examVoucherDiv.style.display = "none"; // Hide the exam voucher
    });
});



     