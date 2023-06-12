module Main exposing (..)

import Browser
import Element exposing (..)
import Element.Background as Background
import Element.Border as Border
import Element.Font as Font
import Element.Input as Input
import Html exposing (Html)


main =
    Browser.sandbox
        { init = init
        , update = update
        , view = view
        }


type alias Model =
    { myNum : Int
    }


init : Model
init =
    { myNum = 42
    }


type Msg
    = UpdateNum Int
    | DoNothing


update msg model =
    case msg of
        UpdateNum newNumber ->
            { myNum = newNumber }

        DoNothing ->
            model


colors x =
    List.foldr (++) [] <|
        List.map (\( count, color ) -> List.repeat count color) x


gold =
    rgb255 209 146 4


view : Model -> Html Msg
view model =
    Element.layout
        [ Background.gradient
            { angle = pi
            , steps =
                colors
                    [ ( 1, black )
                    , ( 1, rgb255 65 0 135 )
                    , ( 20, rgb255 120 6 241 )
                    , ( 1, rgb255 65 0 135 )
                    , ( 1, black )
                    ]
            }
        ]
    <|
        Element.column
            [ centerX
            , centerY
            , spacing 15
            ]
            [ Element.el
                [ centerX
                , centerY
                , Font.size 50
                , Font.bold
                , Font.color gold
                ]
              <|
                text "Contact Info"
            , Element.column
                [ centerX, width <| px 400 ]
              <|
                List.map textbox
                    [ "wcourtney@marion.k12.in.us"
                    , "765-664-9051 x8047"
                    , "Marion High School"
                    , "750 W. 26th Street"
                    , "Marion, IN 46953"
                    ]
            ]


textbox myText =
    Input.text [ width fill ]
        { label = Input.labelAbove [] <| text ""
        , onChange = \_ -> DoNothing
        , placeholder = Nothing
        , text = myText
        }


grey x =
    rgb255 x x x


white =
    grey 255


black =
    grey 0


red =
    rgb 1 0 0


green =
    rgb 0 1 0


blue =
    rgb 0 0 1


purple =
    rgb 1 0 1


doubleIt x =
    x * 2


incrementIt x =
    x + 1


decrementIt x =
    x - 1


customButton attr fun myNum txt =
    Input.button
        ([ Background.color <| rgb 0 0 1
         , centerX
         , centerY
         , width <| px 140
         , paddingEach { bottom = 10, left = 10, right = 10, top = 10 }
         ]
            ++ attr
        )
        { onPress = Maybe.Just <| UpdateNum <| fun myNum
        , label = Element.el [ centerX, centerY ] <| text txt
        }
