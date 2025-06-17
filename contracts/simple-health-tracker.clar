
;; Simple Health Tracker
;; Users can log and view their health records

(define-map health-logs
  principal
  { date: (string-ascii 10), notes: (string-ascii 100) })

(define-map has-logged
  principal
  bool)

(define-constant err-already-logged (err u100))
(define-constant err-no-log-found (err u101))

;; Log health status for the day (only once per user)
(define-public (log-health (date (string-ascii 10)) (notes (string-ascii 100)))
  (begin
    (asserts! (is-none (map-get? has-logged tx-sender)) err-already-logged)
    (map-set health-logs tx-sender { date: date, notes: notes })
    (map-set has-logged tx-sender true)
    (ok true)))

;; View own health log
(define-read-only (get-my-log)
  (match (map-get? health-logs tx-sender)
    log (ok log)
    err-no-log-found))
