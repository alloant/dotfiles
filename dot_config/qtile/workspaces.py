# Justine Smithies
# https://github.com/justinesmithies/qtile-wayland-dotfiles

# Workspace setup
# Get the icons at https://www.nerdfonts.com/cheat-sheet

from libqtile.config import Match

workspaces = [
    {
        "name": " ₁",
        "key": "1",
        "matches": [
            Match(wm_class='firefox'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": " ₂",
        "key": "2",
        "matches": [
            Match(wm_class='foot'),
            Match(wm_class='ranger'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": " ₃",
        "key": "3",
        "matches": [
            Match(wm_class='nvim'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": " ₄",
        "key": "4",
        "matches": [
            Match(wm_class='telegram-desktop'),
            Match(wm_class='weechat'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": " ₅",
        "key": "5",
        "matches": [
            Match(wm_class='gimp-2.99'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": "󰓇 ₆",
        "key": "6",
        "matches": [
            Match(wm_class='Spotify'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": " ₇",
        "key": "7",
        "matches": [
            Match(wm_class='soffice'),
            Match(wm_class='libreoffice-startcenter'),
            Match(wm_class='libreoffice-writer'),
            Match(wm_class='libreoffice-base'),
            Match(wm_class='libreoffice-calc'),
            Match(wm_class='libreoffice-draw'),
            Match(wm_class='libreoffice-impress'),
            Match(wm_class='libreoffice-math'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": "󰎕 ₈",
        "key": "8",
        "matches": [
            Match(wm_class='newsboat'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
    {
        "name": "󰇮 ₉",
        "key": "9",
        "matches": [
            Match(wm_class='aerc'),
        ],
        "layout": "monadtall",
        "spawn": [],
    },
]
