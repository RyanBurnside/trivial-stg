(cl:in-package :trivial-stg)

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

(defgeneric collides-p (instance-a instance-b))
(defmethod collides-p ((a hitbox) (b hitbox))
  (not
   (or
    (> (compute-top a) (compute-bottom b))
    (< (compute-bottom a) (compute-top b))
    (> (compute-left a) (compute-right b))
    (< (compute-right a) (compute-left b)))))

