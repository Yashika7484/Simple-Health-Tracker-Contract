;; Simple Health Tracker Contract
;; A basic health data tracking system on Stacks blockchain

;; Constants
(define-constant contract-owner tx-sender)
(define-constant err-owner-only (err u100))
(define-constant err-not-authorized (err u101))
(define-constant err-invalid-data (err u102))
(define-constant err-user-not-found (err u103))

;; Data structures
(define-map health-records 
  principal 
  {
    weight: uint,
    height: uint,
    steps: uint,
    last-updated: uint
  })

(define-map user-permissions principal bool)
(define-data-var total-users uint u0)

;; Function 1: Record Health Data
;; Allows users to record their health metrics
(define-public (record-health-data (weight uint) (height uint) (steps uint))
  (begin
    ;; Validate input data
    (asserts! (and (> weight u0) (> height u0)) err-invalid-data)
    (asserts! (<= steps u100000) err-invalid-data) ;; reasonable daily step limit
    
    ;; Check if user exists, if not increment total users
    (let ((existing-record (map-get? health-records tx-sender)))
      (if (is-none existing-record)
        (var-set total-users (+ (var-get total-users) u1))
        true))
    
    ;; Store health record
    (map-set health-records tx-sender {
      weight: weight,
      height: height, 
      steps: steps,
      last-updated: block-height
    })
    
    ;; Grant user permission to access their data
    (map-set user-permissions tx-sender true)
    
    (ok true)))

;; Function 2: Get Health Summary
;; Retrieves health data for a specific user
(define-read-only (get-health-summary (user principal))
  (let ((record (map-get? health-records user)))
    (match record
      health-data (ok health-data)
      (err err-user-not-found))))

;; Helper function: Get user's own health data
(define-read-only (get-my-health-data)
  (get-health-summary tx-sender))

;; Get total registered users
(define-read-only (get-total-users)
  (ok (var-get total-users)))

;; Check if user has recorded health data
(define-read-only (has-health-record (user principal))
  (ok (is-some (map-get? health-records user))))