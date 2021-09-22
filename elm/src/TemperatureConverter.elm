module TemperatureConverter exposing (main)

import Browser exposing (Document, UrlRequest, application)
import Browser.Navigation exposing (Key)
import Html exposing (text)
import Url exposing (Url)


main : Program Flags Model Msg
main =
    application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlRequest = onUrlRequest
        , onUrlChange = onUrlChange
        }



-- Model


type alias Flags =
    ()


type alias Model =
    ()


init : Flags -> Url -> Key -> ( Model, Cmd msg )
init _ _ _ =
    ( (), Cmd.none )



-- Update


type Msg
    = Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update _ model =
    ( model, Cmd.none )



-- Subscriptions


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- View


view : Model -> Document Msg
view _ =
    { title = "title", body = [ text "hello" ] }



-- Navigation


onUrlRequest : UrlRequest -> Msg
onUrlRequest _ =
    Msg


onUrlChange : Url -> Msg
onUrlChange _ =
    Msg
