$(function() {
  $('input.criterium-score-js').change(function(event) {
    var $this = $(this),
        form = $this.closest('form'),
        // cursameScore = form.find('.cursame-score-js'),
        inputs = form.find('input.criterium-score-js'),
        finalScore = form.find('.final-score-js'),
        finalScoreDiv = form.find('.final-score-js'),
        criteriaScore = 0,
        // cursameCriteriumPercentage = 0,
        cursamePercentage = 100.0;

    inputs.each(function(index, input) {
      var percentage = parseFloat($(input).data('criterium-percentage'))
      cursamePercentage -= percentage;

      if ( ! input.value == "") {
        criteriaScore += (percentage / 100.0) * parseFloat(input.value);
      };
    });

    console.log(cursamePercentage);
    // var cursameScore = (cursamePercentage / 100.0 ) * parseFloat(cursameScore.text()),
    //     finalScore = criteriaScore + cursameScore;

    if (criteriaScore < 0 || criteriaScore > 10 ) {
      Notice('error', 'La calificación final no puede ser superior a 10 o menor a 0.')
    } else {
      finalScoreDiv.text( criteriaScore.toFixed(2) );
    };
  });
});