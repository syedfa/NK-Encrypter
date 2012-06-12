$(document).bind("mobileinit", function(){
    // Make your jQuery Mobile framework configuration changes here!
    
    $.mobile.allowCrossDomainPages = true;
    $.support.cors = true;
    $.mobile.touchOverflowEnabled = true;
	$.mobile.zoom.disable();
        
    // Navigation
    $.mobile.page.prototype.options.backBtnText = "Back";
    $.mobile.page.prototype.options.addBackBtn = true;
    $.mobile.page.prototype.options.backBtnTheme = "a";
    
    // Page
    $.mobile.page.prototype.options.headerTheme = "a";  // Page header only
    $.mobile.page.prototype.options.contentTheme    = "c";
    $.mobile.page.prototype.options.footerTheme = "a";
    
    // Listviews
    $.mobile.listview.prototype.options.headerTheme = "a";  // Header for nested lists
    $.mobile.listview.prototype.options.theme           = "c";  // List items / content
    $.mobile.listview.prototype.options.dividerTheme    = "b";  // List divider

    $.mobile.listview.prototype.options.splitTheme   = "c";
    $.mobile.listview.prototype.options.countTheme   = "c";
    $.mobile.listview.prototype.options.filterTheme = "c";
    $.mobile.listview.prototype.options.filterPlaceholder = "Filter Data";
    
    $.mobile.defaultPageTransition = 'slide';

	$.mobile.loadingMessage = "Loading";
});