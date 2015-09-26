// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

function do_patient_search(query) {
  var patientSearch = $.get(
    "patients",
    { query: query, limit: 50 },
    function(result) {
      var dataList = $("#patient-results");
      dataList.empty();
      if(result.length) {
        for(var i=0, len=result.length; i<len; i++) {
          var patient = result[i];
          var tr = $("<tr />").attr("data-href", "/patients/" + patient.id + "/edit").addClass("clickable-row");
          tr.append($("<td />").text(patient.id));
          tr.append($("<td />").text(patient.first_name));
          tr.append($("<td />").text(patient.last_name));
          tr.append($("<td />").text(patient.dob));
          tr.append($("<td />").text(patient.va_status));
  //![if IE 9] <select disabled style="display:none"
          var opt = $("<option></option>").attr("value", patient.first_name).append(tr);
          dataList.append(opt);
  //![if IE 9] </select
        }
      }
    },
    "json"
  );
}

$(document).ready(function() {
  showWhenValueEquals("[name='patient[travel_status_id]']", 4, "#benefitsOther");
  showWhenValueEquals("[name='patient[scid_eligibility_id]']", 1, "#sciDetails");
  showWhenValueEquals("[name='patient[scid_eligibility_id]']", 4, "#sciOther");
  showWhenValueEquals("[name='patient[is_receiving_non_va_care]']", "true", "#bowelBladderDetails");
  showWhenValueEquals("[name='patient[principle_pcp_va_nonva_id]']", 1, "#principleVa");
  showWhenValueEquals("[name='patient[principle_pcp_va_nonva_id]']", 2, "#principleNonVa");
  showWhenValueEquals("[name='patient[va_status_id]']", 4, "#expiredDate");
  $("#patient-search-box").on("input", function(e) {
    var val = $(this).val();
    if (val === "") return;
    do_patient_search(val);
  });
});
