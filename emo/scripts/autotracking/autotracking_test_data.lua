-- Auto-generes a partir de emo/scripts/autotracking/autotracking.lua
-- Toutes les adresses memoire (0xXXXXXXX) utilisees par l'autotracker, triees et fusionnees par blocs consecutifs.
AUTOTRACKING_TEST_ADDRESSES = {
        0x0000200,
        0x2002ac0,
        0x2002ae4,
        0x2002ae8,
        0x2002aeb,
        0x2002aee, -- -> 0x2002af0 (3 octets consecutifs)
        0x2002b30,
        0x2002b32, -- -> 0x2002b37 (6 octets consecutifs)
        0x2002b39,
        0x2002b3f, -- -> 0x2002b45 (7 octets consecutifs)
        0x2002b48,
        0x2002b4e, -- -> 0x2002b4f (2 octets consecutifs)
        0x2002b58, -- -> 0x2002b62 (11 octets consecutifs)
        0x2002b6b, -- -> 0x2002b75 (11 octets consecutifs)
        0x2002c40,
        0x2002c67, -- -> 0x2002c6b (5 octets consecutifs)
        0x2002c81, -- -> 0x2002c8d (13 octets consecutifs)
        0x2002c9c,
        0x2002ca2, -- -> 0x2002ca7 (6 octets consecutifs)
        0x2002cbd, -- -> 0x2002cbe (2 octets consecutifs)
        0x2002cc0,
        0x2002cc2, -- -> 0x2002cc3 (2 octets consecutifs)
        0x2002cc5,
        0x2002cc7,
        0x2002ccb,
        0x2002ccd, -- -> 0x2002cde (18 octets consecutifs)
        0x2002ce0,
        0x2002ce3, -- -> 0x2002ce6 (4 octets consecutifs)
        0x2002ce8, -- -> 0x2002ce9 (2 octets consecutifs)
        0x2002ceb,
        0x2002cee, -- -> 0x2002cf0 (3 octets consecutifs)
        0x2002cf2, -- -> 0x2002cf5 (4 octets consecutifs)
        0x2002cfc, -- -> 0x2002cfe (3 octets consecutifs)
        0x2002d00, -- -> 0x2002d08 (9 octets consecutifs)
        0x2002d0a, -- -> 0x2002d14 (11 octets consecutifs)
        0x2002d1c, -- -> 0x2002d28 (13 octets consecutifs)
        0x2002d2a, -- -> 0x2002d2c (3 octets consecutifs)
        0x2002d3f, -- -> 0x2002d45 (7 octets consecutifs)
        0x2002d45, -- -> 0x2002d46 (2 octets consecutifs)
        0x2002d56, -- -> 0x2002d5a (5 octets consecutifs)
        0x2002d5a, -- -> 0x2002d5c (3 octets consecutifs)
        0x2002d6f, -- -> 0x2002d74 (6 octets consecutifs)
        0x2002d89,
        0x2002d89, -- -> 0x2002d97 (15 octets consecutifs)
        0x2002da2,
        0x2002da2, -- -> 0x2002da4 (3 octets consecutifs)
        0x2002da4, -- -> 0x2002da7 (4 octets consecutifs)
        0x2002da9, -- -> 0x2002dac (4 octets consecutifs)
        0x2002dbb, -- -> 0x2002dbc (2 octets consecutifs)
        0x2002dbe, -- -> 0x2002dc2 (5 octets consecutifs)
        0x2002e9c, -- -> 0x2002ea8 (13 octets consecutifs)
        0x2002eac, -- -> 0x2002eb2 (7 octets consecutifs)
}

-- Tous les flags/masques (0xXX) utilises par l'autotracker.
AUTOTRACKING_TEST_FLAGS = {
        0x00, 0x01, 0x02, 0x04, 0x05, 0x08, 0x0c, 0x10, 0x11, 0x15, 0x20, 0x2c, 0x40, 0x41, 0x46, 0x51, 0x55, 0x65, 0x6a, 0x6d, 0x6e, 0x6f, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x80, 0x81, 0x91, 0xf2, 0xf3
}
