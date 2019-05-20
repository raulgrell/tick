const recycler = {
  create(name) {
    name = name.toUpperCase();
    const list = recycler.nodes[name];
    return list !== undefined && list.pop() || document.createElement(name);
  },
  createNS(name, ns) {
    name = name.toUpperCase();
    const list = recycler.nodes[name + ns];
    const node = list !== undefined && list.pop() || document.createElementNS(ns, name);
    node.asmDomNS = ns;
    return node;
  },
  createText(text) {
    const list = recycler.nodes['#text'];
    if (list !== undefined) {
      const node = list.pop();
      if (node !== undefined) {
        node.nodeValue = text;
        return node;
      }
    }
    return document.createTextNode(text);
  },
  createComment(comment) {
    const list = recycler.nodes['#comment'];
    if (list !== undefined) {
      const node = list.pop();
      if (node !== undefined) {
        node.nodeValue = comment;
        return node;
      }
    }
    return document.createComment(comment);
  },
  collect(node) {
    // clean
    let i;

    // eslint-disable-next-line
    while (i = node.lastChild) {
      node.removeChild(i);
      recycler.collect(i);
    }
    i = node.attributes !== undefined ? node.attributes.length : 0;
    while (i--) node.removeAttribute(node.attributes[i].name);
    node.asmDomVNode = undefined;
    if (node.asmDomRaws !== undefined) {
      node.asmDomRaws.forEach((raw) => {
        node[raw] = undefined;
      });
      node.asmDomRaws = undefined;
    }
    if (node.asmDomEvents !== undefined) {
      Object.keys(node.asmDomEvents).forEach((event) => {
        node.removeEventListener(event, node.asmDomEvents[event], false);
      });
      node.asmDomEvents = undefined;
    }
    if (node.nodeValue !== null && node.nodeValue !== '') {
      node.nodeValue = '';
    }
    Object.keys(node).forEach((key) => {
      if (
        key[0] !== 'a' || key[1] !== 's' || key[2] !== 'm' ||
        key[3] !== 'D' || key[4] !== 'o' || key[5] !== 'm'
      ) {
        node[key] = undefined;
      }
    });

    // collect
    let name = node.nodeName;
    if (node.asmDomNS !== undefined) name += node.namespaceURI;
    const list = recycler.nodes[name];
    if (list !== undefined) list.push(node);
    else recycler.nodes[name] = [node];
  },
  nodes: {},
};

export const nodes = { 0: null };
let lastPtr = 0;

const addPtr = (node) => {
  if (node === null) return 0;
  if (node.asmDomPtr !== undefined) return node.asmDomPtr;
  nodes[++lastPtr] = node;
  // eslint-disable-next-line
  return node.asmDomPtr = lastPtr;
};

export default {
  'addNode'(node) {
    addPtr(node.parentNode);
    addPtr(node.nextSibling);
    return addPtr(node);
  },
  'createElement'(tagName) {
    return addPtr(recycler.create(tagName));
  },
  'createElementNS'(namespaceURI, qualifiedName) {
    return addPtr(recycler.createNS(qualifiedName, namespaceURI));
  },
  'createTextNode'(text) {
    return addPtr(recycler.createText(text));
  },
  'createComment'(text) {
    return addPtr(recycler.createComment(text));
  },
  'createDocumentFragment'() {
    return addPtr(document.createDocumentFragment());
  },
  'insertBefore'(parentNodePtr, newNodePtr, referenceNodePtr) {
    nodes[parentNodePtr].insertBefore(
      nodes[newNodePtr],
      nodes[referenceNodePtr],
    );
  },
  'removeChild'(childPtr) {
    const node = nodes[childPtr];
    if (node === null || node === undefined) return;
    const parent = node.parentNode;
    if (parent !== null) parent.removeChild(node);
    recycler.collect(node);
  },
  'appendChild'(parentPtr, childPtr) {
    nodes[parentPtr].appendChild(nodes[childPtr]);
  },
  'removeAttribute'(nodePtr, attr) {
    nodes[nodePtr].removeAttribute(attr);
  },
  'setAttribute'(nodePtr, attr, value) {
    nodes[nodePtr].setAttribute(attr, value);
  },
  'parentNode': (nodePtr) => {
    const node = nodes[nodePtr];
    return (
      node !== null && node !== undefined &&
      node.parentNode !== null
    ) ? node.parentNode.asmDomPtr : 0;
  },
  'nextSibling': (nodePtr) => {
    const node = nodes[nodePtr];
    return (
      node !== null && node !== undefined &&
      node.nextSibling !== null
    ) ? node.nextSibling.asmDomPtr : 0;
  },
  'setNodeValue': (nodePtr, text) => {
    nodes[nodePtr].nodeValue = text;
  },
};
