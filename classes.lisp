(cl:in-package :trivial-stg)

;; Note, these objects are designed to work best for this demo.
;; They may not be as complex, flexible, or reusable as they could be

(defclass mover ()
  ((center-position
    :accessor center-position
    :initarg :center-position
    :initform (gamekit:vec2 0.0 0.0))
   (velocity-vector
    :accessor velocity-vector
    :initarg :velocity-vector
    :initform (gamekit:vec2 0.0 0.0))))

(defgeneric update-object (instance))
(defmethod update-object ((m mover))
  (incf (x (center-position m)) (x (velocity-vector m)))
  (incf (y (center-position m)) (y (velocity-vector m))))
   
(defclass hitbox ()
  ((dimensions
    :accessor dimensions
    :initarg :dimensions
    :initform (gamekit:vec2 1.0 1.0))
   (center-position
    :accessor center-position
    :initarg :center-position
    :initform (gamekit:vec2 0.0 0.0))))


(defgeneric compute-half-width (instance))
(defmethod compute-half-width ((h hitbox))
  (* (gamekit:x (dimensions h)) 0.5))

(defgeneric compute-half-height (instance))
(defmethod compute-half-height ((h hitbox))
  (* (gamekit:y (dimensions h)) 0.5))

(defgeneric compute-top (instance))
(defmethod compute-top ((h hitbox))
  (- (gamekit:y (center-position h))
     (compute-half-height h)))

(defgeneric compute-right (instance))
(defmethod compute-right ((h hitbox)) 
  (+ (gamekit:x (center-position h))
     (compute-half-width h)))

(defgeneric compute-left (instance))
(defmethod compute-left ((h hitbox))
  (- (gamekit:x (center-position h))
     (compute-half-width h)))

(defgeneric compute-bottom (instance))
(defmethod compute-bottom ((h hitbox))
  (+ (gamekit:y (center-position h))
     (compute-half-height h)))

(defgeneric collide-p (instance-a instance-b))
(defmethod collide-p ((a hitbox) (b hitbox))
  (not
   (or
    (> (compute-top a) (compute-bottom b))
    (< (compute-bottom a) (compute-top b))
    (> (compute-left a) (compute-right b))
    (< (compute-right a) (compute-left b)))))

;; For the sake of simplicty, game objects have 1 hitbox in this demo
;; You may, in your project keep a collection but this is usually not necessary in shmups

(defclass game-object (mover hitbox)
  ((sprite
    :accessor sprite
    :initarg sprite
    :initform null)))


