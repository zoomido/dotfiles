// Settings
// --------
settings.hintAlign = "left"
settings.tabsThreshold = 2;
settings.focusFirstCandidate = true
settings.modeAfterYank = "Normal"
//Hints.numericHints=true;
Hints.characters = 'asdqwehl';

// Turn off emoji autocompletion when typing colon
iunmap(":");


// Custom mappings
// ---------------

// Space to jump down
map('<Space>', 'd');

// Make $ work for visual selection
vmap('<Alt-$>', '$');
// Make 0 and $ scroll left and right
unmap('0');
map('0', 'h');
map('<Alt-$>', 'l');
map('<Ctrl-h>', 'h');
map('<Ctrl-l>', 'l');

// Open bookmark search
map('ob', 'b');

// Open link in background tab
unmap('b');
map('bf', 'gf');
// Capital F for opening in a background tab
map('F', 'gf');

// Go to previous tab
map('p', '<Ctrl-6>');

// Change tab next and previous
map('h', 'E');
map('l', 'R');

// Change history forward and back
map('H', 'S');
map('L', 'D');


// Omnibar mappings
cmap('<Ctrl-j>', '<Tab>');
cmap('<Ctrl-k>', '<Shift-Tab>');


// Examples
// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
//map('gt', 'T');
// an example to remove mapkey `Ctrl-i`
//unmap('<Ctrl-i>');
// an example to create a new mapping `ctrl-y`
//mapkey('<Ctrl-y>', 'Show me the money', function() {
//    Front.showPopup('a well-known phrase uttered by characters in the 1996 film Jerry Maguire (Escape to close).');
//});


// Appearance
// -------------

// Change link hints
Hints.style('font-size: 12px; font-family: Input Sans Condensed, Charcoal, sans-serif;');
// Change text hints
Hints.style('font-size: 10px; font-family: Input Sans Condensed, Charcoal, sans-serif;', 'text');

// set theme
settings.theme = `
.sk_theme {
    font-family: Input Sans Condensed, Charcoal, sans-serif;
    font-size: 18px;
    background: #383438;
    color: #babeb1;
}
.sk_theme tbody {
    color: #fff;
}
.sk_theme input {
    color: #d0d0d0;
}
.sk_theme .url {
    color: #888d98;
    font-size: 85%;
    font-weight: normal !important;
}
.sk_theme .annotation {
    color: #56b6c2;
}
.sk_theme .omnibar_highlight {
    color: mediumaquamarine;
}
.sk_theme .omnibar_timestamp,
.sk_theme .omnibar_folder,
.sk_theme .omnibar_visitcount {
    color: #6d7177;
    font-size: 85%;
}
.sk_theme #sk_omnibarSearchResult ul li:nth-child(odd) {
    background: #303030;
}
.sk_theme #sk_omnibarSearchResult ul li.focused {
    background: #3e4452;
}
#sk_status, #sk_find {
    font-size: 26px;
}
`;
// click `Save` button to make above settings to take effect.
