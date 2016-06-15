<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<template:addResources type="css" resources="owl.carousel.css" />
<template:addResources type="css" resources="owl.theme.css" />
<template:addResources type="css" resources="owl.transitions.css" />
<template:addResources type="css" resources="cssTest.css" />
<template:addResources type="css" resources="carousel.css" />

<template:addResources type="javascript" resources="owl.carousel.js" />
<template:addResources type="javascript" resources="custom.js"/>

<c:if test="${renderContext.editMode}">
  <template:module path="*"/>
  <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jnt:carimage')}" var="curNode">
    <c:set var="pic" value="${curNode.properties['image']}"/>
    <c:url value="${pic.node.url}" var="imgUrl"></c:url>
    <div class="editItem">
      <img src="${imgUrl}"/>
    </div>
  </c:forEach>
  
  <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jnt:cartext')}" var="currentNode">
    <div class="editItem carousel-text">
      <c:if test="${not empty currentNode.properties['title']}">
        <span class="carouselTextTitle">${currentNode.properties['title'].string}</span><br/>
      </c:if>
      <c:if test="${not empty currentNode.properties['quoteAuthor']}">
        <div class="carouselTextQuote">"${currentNode.properties['text'].string}"</div>
      </c:if>
      <c:if test="${empty currentNode.properties['quoteAuthor']}">
        <div class="carouselTextText">${currentNode.properties['text'].string}</div>
      </c:if>
      <c:if test="${not empty currentNode.properties['quoteAuthor']}">
        <div class="carouselTextAuthor"> - ${currentNode.properties['quoteAuthor'].string}</div>
      </c:if>
    </div>
  </c:forEach>
  
</c:if>

<c:if test="${not renderContext.editMode}">
  
  <c:set var="thisID" value="${currentNode.properties['id'].string}"/>
  <c:set var="uniqueID" value="carousel${thisID}"/>
  
  <!-- Store the variables in a hidden div that will be read by the javascript to customize each carousel -->
  <!-- Each property can be accessed by combining the selectors for the class unique to this carousel (uniqueID)
		and the name of the property, preceded by 'carousel', e.g. carouselItems -->
  <div class="hiddenVars ${uniqueID}">
    
    <!-- getting the user-provided default number of items per page at max browser width -->
    <c:if test="${not empty currentNode.properties['items']}">
      <c:set var="items" value="${currentNode.properties['items'].string}"/>
    </c:if>
    <c:if test="${empty currentNode.properties['items']}">
      <c:set var="items" value="5"/>
	</c:if>
    <div class="${uniqueID} carouselItems">${items}</div>
    
    <!-- number of slides visible at different browser sizes -->
   
    <!-- display only a single item per page -->
    <c:if test="${currentNode.properties['singleItem'].string == 'true'}">
      <c:set var="singleItem" value="true"/>
    </c:if>
    <c:if test="${currentNode.properties['singleItem'].string == 'false'}">
      <c:set var="singleItem" value="false"/>
    </c:if>
    <div class="${uniqueID} carouselSingleItem">${singleItem}</div>
    
    <!-- autoPlay: specified ms transitions. Default: false -->
    <c:if test="${currentNode.properties['autoPlay'].string == 'true'}">
      <c:if test="${empty currentNode.properties['autoPlayTime']}">
        <c:set var="autoPlay" value="5000"/>
      </c:if>
      <c:if test="${not empty currentNode.properties['autoPlayTime']}">
        <c:set var="autoPlay" value="${currentNode.properties['autoPlayTime'].string}"/>
      </c:if>
    </c:if>
    <c:if test="${currentNode.properties['autoPlay'].string == 'false'}">
      <c:set var="autoPlay" value="false"/>
    </c:if>
    <div class="${uniqueID} carouselAutoPlay">${autoPlay}</div>
    
    <!-- enable/disable navigation buttons -->
    <c:if test="${currentNode.properties['navigation'].string == 'true'}">
      <c:set var="navigation" value="true"/>
    </c:if>
    <c:if test="${currentNode.properties['navigation'].string == 'false'}">
      <c:set var="navigation" value="false"/>
    </c:if>
    <div class="${uniqueID} carouselNavigation">${navigation}</div>
    
    <!-- enable/disable pagination -->
    <c:if test="${currentNode.properties['pagination'].string == 'true'}">
      <c:set var="pagination" value="true"/>
    </c:if>
    <c:if test="${currentNode.properties['pagination'].string == 'false'}">
      <c:set var="pagination" value="false"/>
    </c:if>
    <div class="${uniqueID} carouselPagination">${pagination}</div>
    
    <!-- enable/disable pagination numbers -->
    <c:if test="${currentNode.properties['paginationNumbers'].string == 'true'}">
      <c:set var="paginationNumbers" value="true"/>
    </c:if>
    <c:if test="${currentNode.properties['paginationNumbers'].string == 'false'}">
      <c:set var="paginationNumbers" value="false"/>
    </c:if>
    <div class="${uniqueID} carouselPaginationNumbers">${paginationNumbers}</div>
    
    
    
  </div>
  <div class="owl-carousel carouselMain" id="${uniqueID}">
    <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jnt:carouselImage')}" var="curNode">
      <c:set var="pic" value="${curNode.properties['image']}"/>
      <c:url value="${pic.node.url}" var="imgUrl"></c:url>
      <div class="item">
        <img src="${imgUrl}" class="carouselImage"/>
      </div>
    </c:forEach>
    <c:forEach items="${jcr:getChildrenOfType(currentNode, 'jnt:carouselText')}" var="currentNode">
      <div class="item carousel-text">
        <c:if test="${not empty currentNode.properties['title']}">
          <span class="carouselTextTitle">${currentNode.properties['title'].string}</span><br/>
        </c:if>
         <c:if test="${not empty currentNode.properties['quoteAuthor']}">
        <div class="carouselTextQuote">"${currentNode.properties['text'].string}"</div>
        </c:if>
        <c:if test="${empty currentNode.properties['quoteAuthor']}">
          <div class="carouselTextText">${currentNode.properties['text'].string}</div>
        </c:if>
        <c:if test="${not empty currentNode.properties['quoteAuthor']}">
          <div class="carouselTextAuthor"> - ${currentNode.properties['quoteAuthor'].string}</div>
        </c:if>
      </div>
    </c:forEach>
  </div>
</c:if>