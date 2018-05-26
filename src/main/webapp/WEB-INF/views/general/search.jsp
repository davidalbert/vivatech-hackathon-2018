<%@page import="dbd.hackaton.mymechanic.spring.controller.SearchController"%>
<%@page contentType="text/html;charset=UTF-8"%>

<style>

	
	/* site theme */
	/* ---------- */
	
	.title {
	  margin: 20px 0 0 0;
	  font-size: 64px;
	}
	
	.example {
	  padding: 30px 0;
	}
	
	.example-name {
	  margin: 20px 0;
	  font-size: 32px;
	}
	
	.demo {
	  position: relative;
	  *z-index: 1;
	  margin: 50px 0;
	}
	
	.typeahead,
	.tt-query,
	.tt-hint {
	  width: 350px;
	  height: 30px;
	  padding: 8px 12px;
	  font-size: 18px;
	  line-height: 30px;
	  border: 2px solid #ccc;
	  -webkit-border-radius: 8px;
	     -moz-border-radius: 8px;
	          border-radius: 8px;
	  outline: none;
	}
	
	.typeahead {
	  background-color: #fff;
	}
	
	.typeahead:focus {
	  border: 2px solid #0097cf;
	}
	
	.tt-query {
	  -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	     -moz-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	          box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
	}
	
	.tt-hint {
	  color: #999
	}
	
	.tt-menu {
	  width: 422px;
	  margin: 12px 0;
	  padding: 8px 0;
	  background-color: #fff;
	  border: 1px solid #ccc;
	  border: 1px solid rgba(0, 0, 0, 0.2);
	  -webkit-border-radius: 8px;
	     -moz-border-radius: 8px;
	          border-radius: 8px;
	  -webkit-box-shadow: 0 5px 10px rgba(0,0,0,.2);
	     -moz-box-shadow: 0 5px 10px rgba(0,0,0,.2);
	          box-shadow: 0 5px 10px rgba(0,0,0,.2);
	}
	
	.tt-suggestion {
	  padding: 3px 20px;
	  font-size: 18px;
	  line-height: 24px;
	}
	
	.tt-suggestion:hover {
	  cursor: pointer;
	  color: #fff;
	  background-color: #0097cf;
	}
	
	.tt-suggestion.tt-cursor {
	  color: #fff;
	  background-color: #0097cf;
	
	}
	
	.tt-suggestion p {
	  margin: 0;
	}
	
	.gist {
	  font-size: 14px;
	}
	
	/* example specific styles */
	/* ----------------------- */
	
	#custom-templates .empty-message {
	  padding: 5px 10px;
	 text-align: center;
	}
	
	#multiple-datasets .league-name {
	  margin: 0 20px 5px 20px;
	  padding: 3px 0;
	  border-bottom: 1px solid #ccc;
	}
	
	#scrollable-dropdown-menu .tt-menu {
	  max-height: 150px;
	  overflow-y: auto;
	}
	
	#rtl-support .tt-menu {
	  text-align: right;
	}
	
	
	/* custom design by Dan */
	.quickBtn{
		width: 100%;
		height: 100%;
		font-size: 15px;
		background-color: #eeeeee;
		color: #0088fe;
		border: 0px;
	}
	
	.quickRow{
		margin-top: 5px;
		border-radius: 30px;
	}
	
	.appTitle{
		font-size:32px;
		height: 52px;
		vertical-align: middle;
	}
</style>

<script type="text/javascript" src="/assets/js/typeahead.bundle.js"></script>

<div class="row">
	<div class="col appTitle" style="margin-bottom: 30px;margin-top: 20px">
		Workshop Concierge
	</div>
</div>
<div class="row">
	<div class="col">
		
			<form class="form-inline">
				<label class="my-1 mr-2" for="inlineFormCustomSelectPref" style="font-size: 20px">Your car: </label>
				<select class="my-1 mr-sm-2" id="inptCarRegistration" style="width: auto">
			      <option value="Clio AA 123 BB">Clio AA 123 BB</option>
			    </select>
			</form>
			<form class="form-signin" id="formSearch"
				method="POST" action="<%=SearchController.PROCESS_SEARCH%>"
				style="margin-top: 20px">
			
			<div class="row">
				<div class="col" style="text-align: left">
					<label style="margin-bottom: 3px;margin-top: 35px; font-size: 14px">What's the problem  with your car?</label>
					<div id="the-basics"style="margin-top:0px">
						<input class="typeahead" type="text" placeholder="Type in issue type, mechanic name...">
					</div>
				</div>
			</div>
			<div class="row" style="margin-top: 50px">
				<div class="col" style="text-align: left; margin-bottom: 0px;font-size: 14px">
					Or choose a service below:
				</div>
			</div>
			
			<div class="row quickRow">
				<div class="col">
					<button class="quickBtn btn btn-primary" name="searchString2" value="Car inspection">
						Car inspection
					</button>
				</div>
				<div class="col">
					<button class="quickBtn btn btn-primary" name="searchString2" value="Body work">
						Body work
					</button>
				</div>
			</div>
			<div class="row quickRow">
				<div class="col">
					<button class="quickBtn btn btn-primary" name="searchString2" value="Tires">
						Tires
					</button>
				</div>
				<div class="col">
					<button class="quickBtn btn btn-primary" name="searchString2" value="Mechanic / Electric">
						Mechanic / Electric
					</button>
				</div>
			</div>
			<div class="row quickRow">
				<div class="col">
					<button class="quickBtn btn btn-primary" name="searchString2" value="Road worthiness">
						Road worthiness
					</button>
				</div>
				<div class="col">
					<button class="quickBtn btn btn-primary" name="searchString2" value="License plate">
						License plate
					</button>
				</div>
			</div>
			
			<div class="row">
				<div class="col" style="margin-top: 40px">
					<button class="btn btn-danger">
						Help, my car is not starting!
					</button>
				</div>
			</div>
			
			<input type="hidden" name="searchString" id="inptSearchString">
			<input type="hidden" name="carRegistration" id="carRegistration">
			</form>
		
	</div>
</div>



<script>
$(function() {
	var substringMatcher = function(strs) {
		  return function findMatches(q, cb) {
		    var matches, substringRegex;
	
		    // an array that will be populated with substring matches
		    matches = [];
	
		    // regex used to determine if a string contains the substring `q`
		    substrRegex = new RegExp(q, 'i');
	
		    // iterate through the pool of strings and for any string that
		    // contains the substring `q`, add it to the `matches` array
		    $.each(strs, function(i, str) {
		      if (substrRegex.test(str)) {
		        matches.push(str);
		      }
		    });
	
		    cb(matches);
		  };
		};
	
		var states = ['Car inspection', 'Body work', 'Tires', 'Mechanic / Electric', 'Road worthiness',
		  'License plate'
		];
	
		$('#the-basics .typeahead').typeahead(
				{
				  hint: true,
				  highlight: true,
				  minLength: 1
				},
				{
				  name: 'states',
				  source: substringMatcher(states)
				}
			);
		
		$('.typeahead').bind('typeahead:select', function(ev, suggestion) {
			
			$('#inptSearchString').val(suggestion);
			$( "#carRegistration" ).val($('#inptCarRegistration').val());
			
			$('#formSearch').submit();
		});
		
		$('.quickBtn').click(function(event) {
			  $( "#carRegistration" ).val($('#inptCarRegistration').val());
		});

});
</script>