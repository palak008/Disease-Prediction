
  $( function() {
    var availableTags = [
    	"cough","fever","red eyes","muscle pain",
		"runny nose","sore throat","headache","loss of appetite","rashes",
		"fatigue","nausea","vomiting","diarrhea","chills","abdominal pain","weight loss",
		"dark urine","itching","mild bleeding","watery eyes","sweating","weakness",
		"nasal congestion","constipation","low bp","muscle cramp","rapid heart rate",
		"thirst","sleepiness","wheezing","chest pain","shortness of breath",
		"excessive hair loss","mood swings","weight gain","cold hands","joint pain","dehydration",
		"swelling","decreased range of motion","anemia","joint stiffness","dry cough","severe ache",
		"chest congestion","hunger","dry mouth","blurred vision","skin infection","frequent urination",
		"back pain","conjunctivitis","internal bleeding","stomach ache","stiff neck","seizure",
		"abdominal cramps","blood in the stool","bruises","swollen lymph nodes","lack of sleep",
		"depression","anxiety","suffocation","blisters","acidity","indigestion","pelvis pain",
		"vaginal discharge","irregular mensturation","cough with blood","redness of skin",
		"yellow eyes","yellow skin","pimples","pain in eyes","loss of colour","ulcers",
		"loss of sensation","nerve injury","dizziness","irritation","sinus pain","vaginal pain",
		"mental confusion","burning sensation in the eyes","eye discharge","pus","distorted vision","vision loss","swelling in foot",
		"facial bone deformity","slow growth","abdominal swelling","bleeding gums","blood in urine",
		"nose bleeding","bloating","difficulty in swallowing","hoarse voice","irritable bowel syndrome",
		"high bp","	pain in the kidney area","decreased urination","ringing in the ear","hearing loss","dark red spots",
		"sweating less than normal"
    ];
    function split( val ) {
      return val.split( /,\s*/ );
    }
    function extractLast( term ) {
      return split( term ).pop();
    }
 
    $( "#tags" )
      // don't navigate away from the field on tab when selecting an item
      .on( "keydown", function( event ) {
        if ( event.keyCode === $.ui.keyCode.TAB &&
            $( this ).autocomplete( "instance" ).menu.active ) {
          event.preventDefault();
        }
      })
      .autocomplete({
        minLength: 0,
        source: function( request, response ) {
          // delegate back to autocomplete, but extract the last term
          response( $.ui.autocomplete.filter(
            availableTags, extractLast( request.term ) ) );
        },
        focus: function() {
          // prevent value inserted on focus
          return false;
        },
        select: function( event, ui ) {
          var terms = split( this.value );
          // remove the current input
          terms.pop();
          // add the selected item
          terms.push( ui.item.value );
          // add placeholder to get the comma-and-space at the end
          terms.push( "" );
          this.value = terms.join( ", " );
          return false;
        }
      });
  } );
