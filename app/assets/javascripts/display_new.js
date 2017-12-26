$(document).ready(function(){

    // Display request types
    $(".select_1").change(function(){
        $(this).find("option:selected").each(function(){
            var request = $(this).attr("value");
            var w_sim = $('input:checked[name="want_sim"]').val();
            var w_number = $('input:checked[name="want_new_number"]').val();
            $('input[name="number"]').val("");
            if(request == 'smartphone'){
                $("#models").show();
                $("#bam_models").hide();
                $("#want_sim").show();
                if(w_sim == 'true'){
                  $("#want_number").show();
                  if(w_number == 'false'){
                      $("#number").show();
                  }
                  else{
                      $("#number").hide();
                  }
                }
                else{
                  $("#want_number").hide();
                  $("#number").hide();
                }
            }
            else if(request == 'sim'){
              $("#models").hide();
              $("#bam_models").hide();
              $("#want_sim").hide();
              $("#want_number").show();
              if(w_number == 'false'){
                  $("#number").show();
              }
              else{
                  $("#number").hide();
              }
            }

            else{
                $("#models").hide();
                $("#want_sim").hide();
                $("#want_number").hide();
                $("#number").hide();
                $("#bam_models").show();
            }
        });
    }).change();

    // Display secondary menus
    var display_menus = function(){
      var request = $(".select_1 option:selected").attr("value");
      var w_sim = $('input:checked[name="want_sim"]').val();
      var w_number = $('input:checked[name="want_new_number"]').val();
      if(w_sim == 'true') {
          $("#want_number").show();
          if(w_number == 'false'){
              $("#number").show();
          }
          else{
              $("#number").hide();
          }
      }
      else if(w_sim == 'false'){
        if (request != 'sim'){
          $("#want_number").hide();
          $("#number").hide();
        }
        else{
          if(w_number == 'false'){
              $("#number").show();
          }
          else{
              $("#number").hide();
          }
        }
      }
    };

    // Submit Event
    $("form").submit(function(e){
      var phone = $.trim($('input[name="number"]').val());
      var request = $(".select_1 option:selected").attr("value");
      var w_sim = $('input:checked[name="want_sim"]').val();
      var w_new_number = $('input:checked[name="want_new_number"]').val();

      if((request == 'smartphone' && w_sim == 'true' && w_new_number == 'false') ||
      (request == 'sim' && w_new_number == 'false')){
        if( phone.length != 8 || !$.isNumeric(phone)){
          alert('Ingrese número válido');
          e.preventDefault(e);
        }
      }
    });

    // Link events to function
    $('input[name="want_sim"]').change(display_menus);
    $('input[name="want_new_number"]').change(display_menus);

  });
