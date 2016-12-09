//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require underscore
//= require gmaps/google
//= require bootstrap-datepicker
//= require bootstrap-slider
//= require jquery-fileupload/basic
//= require cloudinary/jquery.cloudinary
//= require attachinary
//= require_tree .

$(function() {
  new cf.ConversationalForm({
    formEl: $(".cf-form-element")[0],
    dictionaryData: {
      "input-placeholder": "Ecrivez ici...",
    }, // empty will throw error, see Dictionaty.ts for values
    // dictionaryAI?: {}, // empty will throw error, see Dictionaty.ts for values
    // context?: // context of where to append the ConversationalForm (see also cf-context attribute)
    // tags?: tags, // pass in custom tags (when prevent the auto-instantiation of ConversationalForm)
    // submitCallback?: () => void | HTMLButtonElement // custom submit callback if button[type=submit] || form.submit() is not wanted..
    // userImage: "..." //base64 || image url
  });
});
