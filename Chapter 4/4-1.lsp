(in-package :cs325-user)

(defun rotate-array (array)
  (let ((dimensions (array-dimensions array)))
    (let ((n (car dimensions))
          (rotated-array (make-array dimensions)))
      (dotimes (i n rotated-array)
        (dotimes (j n t)
          (setf (aref rotated-array j (- (1- n) i)) (aref array i j)))))))

(defun nrotate-array (array)
  (let ((max-index (1- (car (array-dimensions array)))))
    (dotimes (i max-index array)
      (dotimes (j (- max-index i) t)
        (unless (< j i)
          (rotatef (aref array (- max-index j) i)
                   (aref array (- max-index i) (- max-index j))
                   (aref array j (- max-index i))
                   (aref array i j)))))))