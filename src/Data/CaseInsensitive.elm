module Data.CaseInsensitive exposing
    ( CI
    , foldedCase
    , map
    , mk
    , original
    , unsafeMk
    )

{-| A @CI@ provides /C/ase /I/nsensitive comparison for a @String@
-}


type CI
    = CI { original : String, foldedCase : String }


foldedCase : CI -> String
foldedCase (CI c) =
    c.foldedCase


original : CI -> String
original (CI c) =
    c.original



-- | Make the given string-like value case insensitive.


mk : String -> CI
mk s =
    CI { original = s, foldedCase = String.toLower s }


{-| Constructs a 'CI' from an already case folded string-like
value. The given string is used both as the 'original' as well as
the 'foldedCase'.

This function is unsafe since the compiler can't guarantee that the
provided string is case folded.

-}
unsafeMk : String -> CI
unsafeMk s =
    CI { original = s, foldedCase = s }



-- | Transform the original string-like value but keep it case insensitive.


map : (String -> String) -> (CI -> CI)
map f =
    \(CI c) ->
        mk <| f <| c.original