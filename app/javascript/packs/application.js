// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
import 'bootstrap';
import '../stylesheets/application';

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";
Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("jquery")
require("../scripts/order")
require("./jquery.validationEngine")
require("./jquery.validationEngine-ja")
require("./modal")
// require("../scripts/nested_form_fields")
// import "/Users/thinkbiz/.rbenv/versions/3.0.0/lib/ruby/gems/3.0.0/gems/nested_form_fields-0.8.4/lib/assets/javascripts/nested_form_fields.js.coffee";
// require("/Users/thinkbiz/.rbenv/versions/3.0.0/lib/ruby/gems/3.0.0/gems/nested_form_fields-0.8.4/lib/assets/javascripts/nested_form_fields.js.coffee")
//= require nested_form_fields