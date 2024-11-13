// Settings
// --------
settings.hintAlign = "left"
settings.tabsThreshold = 2;
settings.focusFirstCandidate = true
settings.modeAfterYank = "Normal"
//Hints.numericHints=true;
api.Hints.characters = 'asdqwehl';

// Turn off emoji autocompletion when typing colon
api.iunmap(":");


// Custom mappings
// ---------------

// CTRL to close omnibar & search (not link hints)
api.map('<Ctrl>', '<Esc>');

// Space to jump down
api.map('<Space>', 'd');

// Make $ work for visual selection
// Use this when vmapkey is fixed (broken after v3 manifest update)
// api.vmapkey('<Alt-$>', '$');
// Make 0 and $ scroll left and right
api.unmap('0');
api.map('0', 'h');
api.map('<Alt-$>', 'l');
api.map('<Ctrl-h>', 'h');
api.map('<Ctrl-l>', 'l');

// Open bookmark search
api.map('ob', 'b');

// Open link in background tab
api.unmap('b');
api.map('bf', 'gf');
// Capital F for opening in a background tab
api.map('F', 'gf');

// Go to previous tab
api.map('p', '<Ctrl-6>');

// Change tab next and previous
api.map('h', 'E');
api.map('l', 'R');

// Change history forward and back
api.map('H', 'S');
api.map('L', 'D');


// Omnibar mappings
api.cmap('<Ctrl-j>', '<Tab>');
api.cmap('<Ctrl-k>', '<Shift-Tab>');


// Examples
// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
//api.map('gt', 'T');
// an example to remove mapkey `Ctrl-i`
//api.unmap('<Ctrl-i>');


// Search engines
// --------------
api.removeSearchAlias('b'); // baidu
api.removeSearchAlias('e'); // original wikipedia
api.removeSearchAlias('w'); // bing
api.addSearchAlias('w', 'wikipedia', 'https://en.wikipedia.org/w/index.php?title=Special:Search&search={0}', 's', 'https://en.wikipedia.org/w/api.php?action=opensearch&search={0}', function(response) {
    return JSON.parse(response.text)[1];
});
api.addSearchAlias('a', 'amazon', 'https://www.amazon.se/s?k={0}', 's');
api.addSearchAlias('d', 'define word', 'https://en.wiktionary.org/w/index.php?search=', 's', 'https://en.wiktionary.org/w/api.php?action=query&format=json&generator=prefixsearch&gpssearch=', function(response) {
    return Object.values(JSON.parse(response.text).query.pages).map((p) => p.title);
});



// Appearance
// -------------

// Change link hints
api.Hints.style('font-size: 12px; font-family: Input Sans Condensed, Charcoal, sans-serif;');
// Change text hints
api.Hints.style('font-size: 10px; font-family: Input Sans Condensed, Charcoal, sans-serif;', 'text');

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
