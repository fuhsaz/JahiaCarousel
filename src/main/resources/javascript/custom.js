$(document).ready(function(){
  
  
  $('.carouselMain').each(function(cur){
    /* defaults */
    var items = 5; /**/
    var itemsCustom = false;
    var itemsDesktop = [1199, 4];
    var itemsDesktopSmall = [980, 3];
    var itemsTablet = [768, 2];
    var itemsTabletSmall = [false];
    var itemsMobile = [479, 1];
    var singleItem = false; /**/
    var itemsScaleUp = false;
    
    var slideSpeed = 200;
    var paginationSpeed = 800;
    var rewindSpeed = 1000;
    
    var autoP = false; /*autoPlay*/ /* also like Scotty P, naw'm sayin'?*/
    var stopOnHover = false;
    
    var navigation = false;  /**/
    var navigationText = ['prev', 'next'];
    var rewindNav = true;
    var scrollPerPage = false;
    
    var pagination = true;  /**/
    var paginationNumbers = false;  /**/
    
    var responsive = true;
    var responsiveRefreshRate = 200;
    var responsiveBaseWidth = $(window);
    
    var lazyLoad = false;
    var lazyFollow = true;
    var lazyEffect = "fade";
    
    var autoHeight = false;
    
    var jsonPath = false;
    var jsonSuccess = false;
    
    var dragBeforeAnimFinish = true;
    var mouseDrag = true;
    var touchDrag = true;
    
    var transitionStyle = false;
    
    var addClassActive = false;
    
    var beforeUpdate = false;
    var afterUpdate = false;
    var beforeInit = false;
    var afterInit = false;
    var beforeMove = false;
    var afterMove = false;
    var afterAction = false;
    var startDragging = false;
    var afterLazyLoad = false;
    
    /* Get the ID of the current carousel, to access the settings set for it specifically */
    var curID = $(this).attr('id');
    /*console.log(curID);*/
    
    /* NUMBER ITEMS ON SCREEN */
    /* Max */
    items = parseInt($(getSS(curID, 'Items')).text());
    console.log(items, typeof items);
    /* Set single item */
    var tempSingle = $(getSS(curID, 'SingleItem')).text();
    if (tempSingle.localeCompare('true') == 0) {
      singleItem = true;
    } else {
      singleItem = false;
    }
    
    /* NAVIGATION */
    /* Set autoplay */
    autoP = $(getSS(curID, 'AutoPlay')).text();
    if (autoP.localeCompare('false') == 0) {
      autoP = false;
    }
    
    /* Enable/Disable navigation buttons */
    var tempNav = $(getSS(curID, 'Navigation')).text();
    if (tempNav.localeCompare('true') == 0) {
      navigation = true;
    } else {
      navigation = false;
    }
    
    /* PAGINATION */
    /* Enable/Disable pagination */
    var tempPag = $(getSS(curID, 'Pagination')).text();
    if (tempPag.localeCompare('true') == 0) {
      pagination = true;
    } else {
      pagination = false;
    }
    /* Enable/Disable pagination numbers*/
    var tempPN = $(getSS(curID, 'PaginationNumbers')).text();
    if (tempPN.localeCompare('true') == 0) {
      paginationNumbers = true;
    } else {
      paginationNumbers = false;
    }
    
    /*console.log("autoP: ", autoP);*/
    $(this).owlCarousel({
      items : items,
      itemsCustom : itemsCustom,
      itemsDesktop : itemsDesktop,
      itemsDesktopSmall : itemsDesktopSmall,
      itemsTablet : itemsTablet,
      itemsTabletSmall : itemsTabletSmall,
      itemsMobile : itemsMobile,
      singleItem : singleItem,
      itemsScapeUp : itemsScaleUp,
      
      slideSpeed : slideSpeed,
      paginationSpeed : paginationSpeed,
      rewindSpeed : rewindSpeed,
      
      autoPlay : autoP,
      stopOnHover : stopOnHover,
      
      navigation : navigation,  /*Show next and prev buttons*/
      navigationText : navigationText,
      rewindNav : rewindNav,
      scrollPerPage : scrollPerPage,
      
      pagination : pagination,
      paginationNumbers : paginationNumbers,
      
      responsive : responsive,
      responsiveRefreshRate : responsiveRefreshRate,
      responsiveBaseWidth : responsiveBaseWidth,
      
      lazyLoad : lazyLoad,
      lazyFollow : lazyFollow,
      lazyEffect : lazyEffect,
      
      autoHeight : autoHeight,
      
      jsonPath : jsonPath,
      jsonSuccess : jsonSuccess,
      
      dragBeforeAnimFinish : dragBeforeAnimFinish,
      mouseDrag : mouseDrag,
      touchDrag : touchDrag,
      
      transitionStyle : transitionStyle,
      
      addClassActive : addClassActive,
      
      beforeUpdate : beforeUpdate,
      afterUpdate : afterUpdate,
      beforeInit : beforeInit,
      afterInit : afterInit,
      beforeMove : beforeMove,
      afterMove : afterMove,
      afterAction : afterAction,
      startDragging : startDragging,
      afterLazyLoad : afterLazyLoad,
    });
  });
  
  /* To generate the '.carouselID .carouselDesiredVariable' selector for jquery */
  function getSS(id, varName){
  	var ss = ".";
    ss += id;
    ss += " .carousel";
    ss += varName;
    return ss;
  };

});