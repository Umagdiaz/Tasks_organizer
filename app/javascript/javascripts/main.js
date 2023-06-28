window.SELECTZ= {
    init: function() {
      SELECTZ.misc.selectizeByScope('body');
    },
    tasks: {
      index: {
        setup: function() {
          console.log('in the index page');
        }
      },
      form: {
        setup: function() {
          
        }
      }
    },
    misc: {
      selectizeByScope: function(selector) {
        $(selector).find('.selectize').each(function(i, el) {
          $(el).selectize();
        });
      }
    }
  };
  
  $(document).on('turbolinks:load', function() {
    SELECTZ.init();
  });