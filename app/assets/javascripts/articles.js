$(document).ready(function() {
  $('#search_keyword').autocomplete({
    source: function(request, response) {
      $.ajax({
        url:  '/search.json',
        type: 'POST',
        data: { keyword: request.term },
        success: function(data) {
          response($.map(data.articles, function (el) {
            return {
              label: el[1],
              value: el[1]
            };
          }));
        }
      });
    },
    minLength: 3,
    delay: 1000
  });
});
