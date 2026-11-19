# HPE colour palette

Reference for the HPE themes (`themes/hpe-*`, styles in `src/hpe.css`).
Source: HPE brand guidelines, colour palette page.

## Primary colours

A crisp, minimal scheme centred on the signature colour, HPE Green.

| Name | HEX | PMS | RGB | CMYK |
|---|---|---|---|---|
| White | `#FFFFFF` | – | 255 255 255 | 0 |
| Black | `#000000` | – | 0 0 0 | 100K |
| Midnight | `#292D3A` | – | 41 45 58 | 80 72 53 50 |
| HPE Green | `#01A982` | 339 C | 1 169 130 | 80 0 60 0 |

## Secondary colours

Assigned to the Dynamic Element when used as a graphic motif.

| Name | HEX | PMS | RGB | CMYK |
|---|---|---|---|---|
| Jade Green | `#05CC93` | – | 5 204 147 | 70 0 52 0 |
| Mint Green | `#00E0AF` | – | 0 224 175 | 59 0 41 0 |
| Cyan | `#62E5F6` | – | 98 229 246 | 58 0 16 0 |
| Blue | `#0070F8` | – | 0 112 248 | 77 45 0 1 |
| Purple | `#7764FC` | – | 119 100 252 | 61 64 0 0 |

## How the themes use it

Interface shades (greys, pale greens, hover tints) come from the HPE design
tokens (npm `hpe-design-tokens`), which derive from this palette and are
tuned for text contrast. Each value in `src/hpe.css` names its token.

| Role | Light | Dark |
|---|---|---|
| Dark surface, text on green | – | Midnight `#292D3A` |
| Selected message | Green 700 `#068667` (darker HPE Green, readable with white text) | Jade Green `#05CC93` |
| Folder icons, green text | Green 800 `#006750` | Jade Green `#05CC93` |
| Unread markers (dot in the list, unread counts) | Purple `#7764FC` | Purple 200 `#9B84FC` |
| New-mail stars | Cyan `#62E5F6`, Blue `#0070F8` outline | same |
| Starred mail (table view) | Purple `#7764FC` row, white text, Jade Green `#05CC93` star | same |
| Starred mail (card view) | Purple tint, Jade Green star | same |

Purple is a touch of accent only: the unread markers and the thread arrow.
New-mail stars use only secondary colours (Cyan and Blue), so they stand
apart from the green selection and the purple unread markers.
