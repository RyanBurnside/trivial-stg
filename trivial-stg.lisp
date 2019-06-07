;;;; trivial-stg.lisp

(in-package #:trivial-stg)

(defparameter *background* (gamekit:vec4 0.2 0.2 0.2 1))
(defparameter *foreground* (gamekit:vec4 0.8 0.8 0.8 1))
(defparameter *player-shots* (list))
(defparameter *enemy-shots* (list))

(defparameter *cw* 240)
(defparameter *ch* 320)


(gamekit:defgame game (gamekit.postproc:postproc) ()
  (:viewport-width 480)
  (:viewport-height 640)
  (:canvas-width *cw*)
  (:canvas-height *ch*)
  (:viewport-title "Trivial-STG")
  (:default-initargs :postproc-indirect-width *cw*
                     :postproc-indirect-height *ch*))

;(gamekit:define-image :ship
;    (asdf:system-relative-pathname :trivial-gamekit-postproc/example "./example/forthebenefitormrkite.png"))

(defmethod gamekit:draw ((this game))
  (gamekit:draw-text "Score" (gamekit:vec2 120 120))
  (bodge-canvas:antialias-shapes nil))

;; run with (trivial-stg::run)
(defun run ()
  (gamekit:start 'game :swap-interval 0))

(run)
