// function updateDistrict() {
//   var curCity = $("#city").val();
//   $("#district option").each(function () {
//     if ($(this).attr("class") == curCity) {
//       $(this).show();
//     } else $(this).hide();
//   });
// }
$("#city").change(function () {
  let cityID = $("#city").val();
  $.get("https://localhost:3000/user/create?city=" + cityID, function (data, status) {
    $("#district").empty();
    $.each(data, function (i, item) {
      $("#district").append(
        $("<option>", {
          value: item.f_ID,
          text: item.f_Name,
        })
      );
    });
  });
});
$("#district").change(function () {
  let districtID = $("#district").val();
  $.get("https://localhost:3000/user/create?district=" + districtID, function (data, status) {
    $("#ward").empty();
    $.each(data, function (i, item) {
      $("#ward").append(
        $("<option>", {
          value: item.f_ID,
          text: item.f_Name,
        })
      );
    });
  });
});
// function updateWard() {
//   var curDistrict = $("#district").val();
//   $("#ward option").each(function () {
//     console.log($(this).attr("class"));
//     console.log(curDistrict);
//     if ($(this).attr("class") == curDistrict) {
//       $(this).show();
//     } else $(this).hide();
//   });
// }
// $("#district").change(function () {
//   updateWard();
// });
