/*!
* tabbable 5.3.3
* @license MIT, https://github.com/focus-trap/tabbable/blob/master/LICENSE
*/
var e=["input","select","textarea","a[href]","button","[tabindex]:not(slot)","audio[controls]","video[controls]",'[contenteditable]:not([contenteditable="false"])',"details>summary:first-of-type","details"];var t=e.join(",");var r="undefined"===typeof Element;var n=r?function(){}:Element.prototype.matches||Element.prototype.msMatchesSelector||Element.prototype.webkitMatchesSelector;var a=!r&&Element.prototype.getRootNode?function(e){return e.getRootNode()}:function(e){return e.ownerDocument};
/**
 * @param {Element} el container to check in
 * @param {boolean} includeContainer add container to check
 * @param {(node: Element) => boolean} filter filter candidates
 * @returns {Element[]}
 */var o=function getCandidates(e,r,a){var o=Array.prototype.slice.apply(e.querySelectorAll(t));r&&n.call(e,t)&&o.unshift(e);o=o.filter(a);return o};
/**
 * @callback GetShadowRoot
 * @param {Element} element to check for shadow root
 * @returns {ShadowRoot|boolean} ShadowRoot if available or boolean indicating if a shadowRoot is attached but not available.
 */
/**
 * @callback ShadowRootFilter
 * @param {Element} shadowHostNode the element which contains shadow content
 * @returns {boolean} true if a shadow root could potentially contain valid candidates.
 */
/**
 * @typedef {Object} CandidatesScope
 * @property {Element} scope contains inner candidates
 * @property {Element[]} candidates
 */
/**
 * @typedef {Object} IterativeOptions
 * @property {GetShadowRoot|boolean} getShadowRoot true if shadow support is enabled; falsy if not;
 *  if a function, implies shadow support is enabled and either returns the shadow root of an element
 *  or a boolean stating if it has an undisclosed shadow root
 * @property {(node: Element) => boolean} filter filter candidates
 * @property {boolean} flatten if true then result will flatten any CandidatesScope into the returned list
 * @property {ShadowRootFilter} shadowRootFilter filter shadow roots;
 */
/**
 * @param {Element[]} elements list of element containers to match candidates from
 * @param {boolean} includeContainer add container list to check
 * @param {IterativeOptions} options
 * @returns {Array.<Element|CandidatesScope>}
 */var i=function getCandidatesIteratively(e,r,a){var o=[];var i=Array.from(e);while(i.length){var l=i.shift();if("SLOT"===l.tagName){var d=l.assignedElements();var u=d.length?d:l.children;var s=getCandidatesIteratively(u,true,a);a.flatten?o.push.apply(o,s):o.push({scope:l,candidates:s})}else{var c=n.call(l,t);c&&a.filter(l)&&(r||!e.includes(l))&&o.push(l);var f=l.shadowRoot||"function"===typeof a.getShadowRoot&&a.getShadowRoot(l);var v=!a.shadowRootFilter||a.shadowRootFilter(l);if(f&&v){var p=getCandidatesIteratively(true===f?l.children:f.children,true,a);a.flatten?o.push.apply(o,p):o.push({scope:l,candidates:p})}else i.unshift.apply(i,l.children)}}return o};var l=function getTabindex(e,t){return e.tabIndex<0&&(t||/^(AUDIO|VIDEO|DETAILS)$/.test(e.tagName)||e.isContentEditable)&&isNaN(parseInt(e.getAttribute("tabindex"),10))?0:e.tabIndex};var d=function sortOrderedTabbables(e,t){return e.tabIndex===t.tabIndex?e.documentOrder-t.documentOrder:e.tabIndex-t.tabIndex};var u=function isInput(e){return"INPUT"===e.tagName};var s=function isHiddenInput(e){return u(e)&&"hidden"===e.type};var c=function isDetailsWithSummary(e){var t="DETAILS"===e.tagName&&Array.prototype.slice.apply(e.children).some((function(e){return"SUMMARY"===e.tagName}));return t};var f=function getCheckedRadio(e,t){for(var r=0;r<e.length;r++)if(e[r].checked&&e[r].form===t)return e[r]};var v=function isTabbableRadio(e){if(!e.name)return true;var t=e.form||a(e);var r=function queryRadios(e){return t.querySelectorAll('input[type="radio"][name="'+e+'"]')};var n;if("undefined"!==typeof window&&"undefined"!==typeof window.CSS&&"function"===typeof window.CSS.escape)n=r(window.CSS.escape(e.name));else try{n=r(e.name)}catch(e){console.error("Looks like you have a radio button with a name attribute containing invalid CSS selector characters and need the CSS.escape polyfill: %s",e.message);return false}var o=f(n,e.form);return!o||o===e};var p=function isRadio(e){return u(e)&&"radio"===e.type};var h=function isNonTabbableRadio(e){return p(e)&&!v(e)};var b=function isZeroArea(e){var t=e.getBoundingClientRect(),r=t.width,n=t.height;return 0===r&&0===n};var m=function isHidden(e,t){var r=t.displayCheck,o=t.getShadowRoot;if("hidden"===getComputedStyle(e).visibility)return true;var i=n.call(e,"details>summary:first-of-type");var l=i?e.parentElement:e;if(n.call(l,"details:not([open]) *"))return true;var d=a(e).host;var u=(null===d||void 0===d?void 0:d.ownerDocument.contains(d))||e.ownerDocument.contains(e);if(r&&"full"!==r){if("non-zero-area"===r)return b(e)}else{if("function"===typeof o){var s=e;while(e){var c=e.parentElement;var f=a(e);if(c&&!c.shadowRoot&&true===o(c))return b(e);e=e.assignedSlot?e.assignedSlot:c||f===e.ownerDocument?c:f.host}e=s}if(u)return!e.getClientRects().length}return false};var g=function isDisabledFromFieldset(e){if(/^(INPUT|BUTTON|SELECT|TEXTAREA)$/.test(e.tagName)){var t=e.parentElement;while(t){if("FIELDSET"===t.tagName&&t.disabled){for(var r=0;r<t.children.length;r++){var a=t.children.item(r);if("LEGEND"===a.tagName)return!!n.call(t,"fieldset[disabled] *")||!a.contains(e)}return true}t=t.parentElement}}return false};var y=function isNodeMatchingSelectorFocusable(e,t){return!(t.disabled||s(t)||m(t,e)||c(t)||g(t))};var S=function isNodeMatchingSelectorTabbable(e,t){return!(h(t)||l(t)<0||!y(e,t))};var w=function isValidShadowRootTabbable(e){var t=parseInt(e.getAttribute("tabindex"),10);return!!(isNaN(t)||t>=0)};
/**
 * @param {Array.<Element|CandidatesScope>} candidates
 * @returns Element[]
 */var R=function sortByOrder(e){var t=[];var r=[];e.forEach((function(e,n){var a=!!e.scope;var o=a?e.scope:e;var i=l(o,a);var d=a?sortByOrder(e.candidates):o;0===i?a?t.push.apply(t,d):t.push(o):r.push({documentOrder:n,tabIndex:i,item:e,isScope:a,content:d})}));return r.sort(d).reduce((function(e,t){t.isScope?e.push.apply(e,t.content):e.push(t.content);return e}),[]).concat(t)};var E=function tabbable(e,t){t=t||{};var r;r=t.getShadowRoot?i([e],t.includeContainer,{filter:S.bind(null,t),flatten:false,getShadowRoot:t.getShadowRoot,shadowRootFilter:w}):o(e,t.includeContainer,S.bind(null,t));return R(r)};var N=function focusable(e,t){t=t||{};var r;r=t.getShadowRoot?i([e],t.includeContainer,{filter:y.bind(null,t),flatten:true,getShadowRoot:t.getShadowRoot}):o(e,t.includeContainer,y.bind(null,t));return r};var I=function isTabbable(e,r){r=r||{};if(!e)throw new Error("No node provided");return false!==n.call(e,t)&&S(r,e)};var C=e.concat("iframe").join(",");var T=function isFocusable(e,t){t=t||{};if(!e)throw new Error("No node provided");return false!==n.call(e,C)&&y(t,e)};export{N as focusable,T as isFocusable,I as isTabbable,E as tabbable};

