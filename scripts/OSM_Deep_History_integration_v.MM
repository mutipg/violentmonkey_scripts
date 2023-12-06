// ==UserScript==
// @name        🗺️ OSM Deep History integration v.MM
// @namespace   Violentmonkey Scripts
// @match       https://www.openstreetmap.org/*
// @match       https://overpass-api.de/achavi/*
// @match       https://rene78.github.io/latest-changes/*
// @grant       none
// @version     1.0.2
// @description 7.09.2023, 08:25:37
// @license     GNU Affero General Public License v3.0
// @author      Marek-M
// @updateURL
// @downloadURL
// ==/UserScript==

(() => {
  'use strict'

  const pattern = /^https?:\/\/(www\.)?(osm\.org|openstreetmap\.org)\/(node|way|relation)\/(\d+)\/?(history|)$/g
  const pattern2 = /^(Zestaw zmian: )(\d+)$/g
  const addHistoryButtons = linkElement => {
    if (linkElement.getAttribute('data-history-button')) return
    const matched = linkElement.href.match(pattern)
    if (!matched) return
    const [_, __, ___, type, id] = matched[0].split('/')

    const set_target = '_blank'
    const set_paddingLeft = '0.45ch'
    const set_paddingRight = '0.20ch'
    const set_position = 'relative'
    const set_top = '-0.5ch'
    const set_display = 'inline-block'
    const set_transform = 'scale(1.1)'
    const set_fontSize = '70%'
    const set_insertAdjacentElement = 'beforeend'

    const historyLink = `https://osmlab.github.io/osm-deep-history/#/${type}/${id}`
    const button = document.createElement('a')
    button.href = historyLink
    button.textContent = 'd'
    button.title = `Check in Osm Deep History - ${type} no. ${id}`
    button.alt = button.title
    button.target = set_target
    button.style.paddingLeft = set_paddingLeft
    button.style.paddingRight = set_paddingRight
    button.style.position = set_position
    button.style.top = set_top
    button.style.display = set_display
    button.style.transform = set_transform
    button.style.fontSize = set_fontSize
    button.addEventListener('click', event => {
      event.stopPropagation()
    })
    linkElement.insertAdjacentElement(set_insertAdjacentElement, button)

    const historyLink2 = `https://pewu.github.io/osm-history/#/${type}/${id}`
    const button2 = document.createElement('a')
    button2.href = historyLink2
    button2.textContent = 'p'
    button2.title = `Check PEWU History Viewer - ${type} no. ${id}`
    button2.alt = button2.title
    button2.target = set_target
    button2.style.paddingLeft = set_paddingLeft
    button2.style.paddingRight = set_paddingRight
    button2.style.position = set_position
    button2.style.top = set_top
    button2.style.display = set_display
    button2.style.transform = set_transform
    button2.style.fontSize = set_fontSize
    button2.addEventListener('click', event => {
      event.stopPropagation()
    })
    linkElement.insertAdjacentElement(set_insertAdjacentElement, button2)

    const historyLink3 = `https://osm.mapki.com/history/${type}/${id}`
    const button3 = document.createElement('a')
    button3.href = historyLink3
    button3.textContent = 'm'
    button3.title = `Check in Mapki (TAGS only) - ${type} no. ${id}`
    button3.alt = button3.title
    button3.target = set_target
    button3.style.paddingLeft = set_paddingLeft
    button3.style.paddingRight = set_paddingRight
    button3.style.position = set_position
    button3.style.top = set_top
    button3.style.display = set_display
    button3.style.transform = set_transform
    button3.style.fontSize = set_fontSize
    button3.addEventListener('click', event => {
      event.stopPropagation()
    })
    linkElement.insertAdjacentElement(set_insertAdjacentElement, button3)

    const historyLink4 = `https://aleung.github.io/osm-visual-history/#/${type}/${id}`
    const button4 = document.createElement('a')
    button4.href = historyLink4
    button4.textContent = 'v'
    button4.title = `Check in Visual Viewer - ${type} no. ${id}`
    button4.alt = button4.title
    button4.target = set_target
    button4.style.paddingLeft = set_paddingLeft
    button4.style.paddingRight = set_paddingRight
    button4.style.position = set_position
    button4.style.top = set_top
    button4.style.display = set_display
    button4.style.transform = set_transform
    button4.style.fontSize = set_fontSize
    button4.addEventListener('click', event => {
      event.stopPropagation()
    })
    linkElement.insertAdjacentElement(set_insertAdjacentElement, button4)

    linkElement.setAttribute('data-history-button', 'true')
  }

  const scanLinks = () => {
    const links = document.querySelectorAll('a')
    links.forEach(addHistoryButtons)
  }

  const observer = new MutationObserver(scanLinks)
  observer.observe(document.body, {
      childList: true,
      subtree: true
  })

  scanLinks()
})()
