# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ($) ->
  $(document).ready ->
		$("#project_id").change (e) ->
			project_id = $(this).val()
			$.ajax "/pdf_xml_mappings/update_mapping_fields/"+project_id,
				success: (data) ->
					$('#mappings').html(data)
					return
			return