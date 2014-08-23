$(function() {
  $('input.criterium-score-js').change(function(event) {
    var $this = $(this),
        form = $this.closest('form'),
        cursameScore = form.find('.cursame-score-js'),
        inputs = form.find('input.criterium-score-js'),
        finalScore = form.find('.final-score-js'),
        finalScoreDiv = form.find('.final-score-js'),
        criteriaScore = 0;

    inputs.each(function(index, input) {
      if ( ! input.value == "") {
        criteriaScore += parseFloat(input.value);
      };
    });

    var subTotalScore = criteriaScore + parseFloat(cursameScore.text()),
        finalScore = parseFloat((subTotalScore/ (inputs.length + 1)).toFixed(1));

    if ( finalScore > 10 || finalScore < 0 ) {
      Notice('error', 'La calificación final no puede ser superior a 10 o menor a 0.')
    } else {
      finalScoreDiv.text( finalScore );
    };
  });
});