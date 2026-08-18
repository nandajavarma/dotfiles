;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Nandaja Varma"
      user-mail-address "nandaja.varma@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
                                        ;(setq doom-font (font-spec :family "SourceCodePro+Powerline+Awesome+Regular" :size 17 :weight 'light)
                                        ;doom-variable-pitch-font (font-spec :family "open sans"))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
;; (setq doom-theme 'doom-acario-dark)


;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(add-to-list 'load-path "~/.emacs.d/tramp/lisp/")
(require 'tramp)


;; ----#START theme setup-----
;; (use-package doom-themes
;;   :ensure t
;;   :config
;;   ;; Global settings (defaults)
;;   (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
;;         doom-themes-enable-italic t) ; if nil, italics is universally disabled
;;   (load-theme 'doom-acario-dark t)

;;   ;; Enable flashing mode-line on errors
;;   (doom-themes-visual-bell-config)
;;   ;; Enable custom neotree theme (all-the-icons must be installed!)
;;   (doom-themes-neotree-config)
;;   ;; or for treemacs users
;;   (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
;;   (doom-themes-treemacs-config)
;;   ;; Corrects (and improves) org-mode's native fontification.
;;   (doom-themes-org-config))
;;   source http://www.mycpu.org/emacs-productivity-setup/
(require 'doom-themes)

(require 'indent-guide)
(indent-guide-global-mode)
(set-face-background 'indent-guide-face "dimgray")

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each
;; theme may have their own settings.
(load-theme 'doom-acario-dark t)

;; Enable flashing mode-line on errors
(doom-themes-visual-bell-config)

;; Enable custom neotree theme
(doom-themes-neotree-config)  ; all-the-icons fonts must be installed!

(setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
(doom-themes-treemacs-config)
;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

(require 'doom-modeline)
(doom-modeline-mode 1)
;; ----#END theme setup-----


;;-----#START Treemacs mousefree switching----
(defun +private/treemacs-back-and-forth ()
       (interactive)
       (if (treemacs-is-treemacs-window-selected?)
           (aw-flip-window)
         (treemacs-select-window)))

(map! :after treemacs
      :leader
      :n "-" #'+private/treemacs-back-and-forth)
;;END Treemacs mousefree switching----

;;;-----#START org mode-------------
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
;; (setq org-directory "~/org/")

;; Org-habit
(require 'org-habit)
(add-to-list 'org-modules 'org-habit)
(use-package! org-habit
  :after org
  :config
  (setq org-habit-following-days 7
        org-habit-preceding-days 35
        org-habit-show-habits t)  )
(setq modus-themes-org-agenda
      '(;; ...
        ;; Other key . value pairs
        ;; ...
        (habit . traffic-light)))


(setq org-agenda-files (directory-files-recursively "~/Workspace/notes/agenda/" "\\.org$"))

;;;-----#START org capture-------------
;;;
;;; to get the file during org capture
;; (org-capture-get :original-file)
;;
;;
;; (after! org
;;        (add-to-list 'org-capture-templates
(setq org-capture-templates
      '(
        ("w" "work" entry
         (file+headline "~/Workspace/notes/agenda/work.org" "Inbox")
         "* TODO %? :work:"
         :prepend t
         :empty-lines 1)
        ("u" "project" entry
         (file+headline "~/Workspace/notes/agenda/projects.org" "Inbox")
         "* TODO %? :project:"
         :prepend t
         :empty-lines 1)
        ("l" "learning" entry
         (file+headline "~/Workspace/notes/garden/learn-inbox.org" "Inbox")
         "* %? :learn:"
         :prepend t
         :empty-lines 1)
        ("c" "chores" entry
         (file+headline "~/Workspace/notes/agenda/chore.org" "Inbox")
         "* TODO %? :chore:"
         :prepend t
         :empty-lines 1)
        ("n" "quick note" entry
         (file+headline "~/Workspace/notes/agenda/todo.org" "Inbox")
         "* TODO %? :NOTE:"
         :prepend t
         :empty-lines 1)
        ("b" "book" entry
         (file+headline "~/Workspace/notes/garden/book-inbox.org" "Inbox")
         "* %? :book:"
         :prepend t
         :empty-lines 1)
        ("h" "home" entry
         (file+headline "~/Workspace/notes/agenda/home.org" "Inbox")
         "* TODO %? :home:"
         :prepend t
         :empty-lines 1)
        ("e" "event" entry
         (file+headline "~/Workspace/notes/agenda/todo.org" "Planned")
         "* %?\nSCHEDULED: %(or (bound-and-true-p my/calfw-timestamp) (format-time-string \"<%Y-%m-%d %a>\"))"
         :prepend t
         :empty-lines 1)
        )
      )

(defun my/create-garden-note ()
       "Create a new note in the garden and open it."
       (interactive)
       (let* ((title (read-string "Note title: "))
              (tags (completing-read-multiple "Tags (comma-separated): "
                                              '("book" "learn" "project" "networking" "writing"
                                                "personal" "reference" "work")
                                              nil nil))
              (slug (replace-regexp-in-string
                     "[^a-z0-9]+" "-"
                     (downcase title)))
              (slug (replace-regexp-in-string "-+$" "" slug))
              (file (expand-file-name
                     (concat slug ".org")
                     "~/Workspace/notes/garden/")))
         (find-file file)
         (when (= (buffer-size) 0)
           (insert (format "#+title: %s\n#+FILETAGS: :%s:\n\n"
                           title
                           (string-join tags ":"))))))

(map! :leader
      :desc "New garden note"
      "n n" #'my/create-garden-note)

;;;-----#END org capture-------------

;;;-----#START auto-refile on state change-------------
(defun my/org-auto-refile-on-state-change ()
       "Auto-refile: DONE/KILL/SKIP → Archive, scheduled TODO → Planned."
       (let ((state org-state)
             (file (buffer-file-name)))
         (when (and file (string-prefix-p
                          (expand-file-name "~/Workspace/notes/agenda/")
                          (expand-file-name file)))
           (cond
            ;; Done/killed → Archive
            ((member state '("DONE" "KILL" "SKIP"))
             (my/org-refile-to-heading "Archive"))
            ;; Scheduled TODO → Planned
            ((and (member state '("TODO"))
                  (org-get-scheduled-time (point)))
             (my/org-refile-to-heading "Planned"))))))

(defun my/org-refile-to-heading (heading)
       "Refile current entry to HEADING in same file."
       (let* ((pos (save-excursion
                     (goto-char (point-min))
                     (when (re-search-forward
                            (format "^\\* %s" (regexp-quote heading)) nil t)
                       (point)))))
         (when pos
           (org-cut-subtree)
           (save-excursion
             (goto-char pos)
             (org-end-of-subtree t t)
             (org-paste-subtree 2)))))

(add-hook 'org-after-todo-state-change-hook #'my/org-auto-refile-on-state-change)
;;;-----#END auto-refile on state change-------------

;;;-----#START org cutom agenda view-------------
(after! org
  ;; Custom Weekly View
  (setq org-agenda-span 7
        org-agenda-start-on-weekday 1  ;; Start on Monday
        org-agenda-show-all-dates t
        org-agenda-start-day "today"  ;; Start from yesterday
        org-agenda-skip-deadline-prewarning-if-scheduled t
        org-agenda-skip-scheduled-if-deadline-is-shown t
        org-agenda-skip-scheduled-if-done t
        org-agenda-skip-deadline-if-done t
        org-agenda-skip-timestamp-if-done t
        org-agenda-time-grid '((daily today require-timed)
                               (800 1000 1200 1400 1600 1800 2000)
                               "......" "────────")
        org-agenda-format-date 'my/org-agenda-format-date)

  ;; Custom agenda view
  ;; Custom function to format date header aesthetically
  (defun my/org-agenda-format-date (date)
         "Format DATE for org-agenda with a more aesthetic look, ensuring correct timestamps."
         (if (not (integerp date))
             (setq date (calendar-absolute-from-gregorian date)))  ;; Ensure DATE is an integer timestamp

         (let ((dayname (format-time-string "%A" (org-time-from-absolute date)))
               (day (format-time-string "%d" (org-time-from-absolute date)))
               (month (format-time-string "%B" (org-time-from-absolute date)))
               (year (format-time-string "%Y" (org-time-from-absolute date))))
           (concat
            "\n"
            (propertize (make-string (window-width) ?─) 'face '(:foreground "#808080"))
            "\n"
            (format "📌 %s, %s %s %s" dayname day month year)
            "\n"
            (propertize (make-string (window-width) ?─) 'face '(:foreground "#808080")))))
  )


;; Skip function: skip habits and anything under * Archive heading
(defun my/org-agenda-skip-habits-and-archive ()
       "Skip habits and entries under Archive headings."
       (let ((subtree-end (save-excursion (org-end-of-subtree t))))
         (cond
          ;; Skip habits
          ((org-is-habit-p)
           subtree-end)
          ;; Skip if under an Archive heading
          ((save-excursion
             (let ((dominated nil))
               (while (and (not dominated) (org-up-heading-safe))
                 (when (string-match-p "^Archive" (org-get-heading t t t t))
                   (setq dominated t)))
               dominated))
           subtree-end)
          ;; Skip DONE/KILL
          ((member (org-get-todo-state) '("DONE" "KILL" "SKIP"))
           subtree-end)
          (t nil))))

(setq org-agenda-custom-commands
      '(("p" "Plan your agenda"
         (
          (todo "TODO" (
                        (org-agenda-overriding-header "⚡ Coming up next")
                        (org-agenda-remove-tags nil)
                        (org-agenda-prefix-format "   %-2i %?b")
                        (org-agenda-todo-keyword-format "")
                        (org-agenda-skip-function '(my/org-agenda-skip-habits-and-archive))))

          (tags  "+chore-TODO=\"TODO\"" (
                                         (org-agenda-overriding-header "\n☂ Chores pending")
                                         (org-agenda-remove-tags t)
                                         (org-agenda-prefix-format "   %-2i %?b")
                                         (org-agenda-skip-function '(my/org-agenda-skip-habits-and-archive))
                                         (org-agenda-todo-keyword-format "")))

          (tags "+NOTE-TODO=\"TODO\"" (
                                       (org-agenda-overriding-header "⚡ Notes")
                                       (org-agenda-remove-tags t)
                                       (org-agenda-prefix-format "   %-2i %?b")
                                       (org-agenda-skip-function '(my/org-agenda-skip-habits-and-archive))
                                       (org-agenda-todo-keyword-format "")))
          (tags "+book-TODO=\"TODO\"" (
                                       (org-agenda-overriding-header "📚 Books and Blogs")
                                       (org-agenda-remove-tags t)
                                       (org-agenda-prefix-format "   %-2i %?b")
                                       (org-agenda-skip-function '(my/org-agenda-skip-habits-and-archive))
                                       (org-agenda-todo-keyword-format "")))
          (tags "+work-TODO=\"TODO\"" (
                                       (org-agenda-overriding-header "🧠 Work")
                                       (org-agenda-remove-tags t)
                                       (org-tags-match-list-sublevels nil)
                                       (org-agenda-show-inherited-tags nil)
                                       (org-agenda-prefix-format "   %-2i %?b")
                                       (org-agenda-skip-function '(my/org-agenda-skip-habits-and-archive))
                                       (org-agenda-todo-keyword-format "")))
          (tags "+tech-TODO=\"TODO\"" (
                                       (org-agenda-overriding-header "🧠 Learning")
                                       (org-agenda-remove-tags t)
                                       (org-tags-match-list-sublevels nil)
                                       (org-agenda-show-inherited-tags nil)
                                       (org-agenda-prefix-format "   %-2i %?b")
                                       (org-agenda-skip-function '(my/org-agenda-skip-habits-and-archive))
                                       (org-agenda-todo-keyword-format "")))
          (tags "+project-TODO=\"TODO\"" (
                                          (org-agenda-overriding-header "\n🛹 Projects")
                                          (org-agenda-remove-tags t)
                                          (org-tags-match-list-sublevels nil)
                                          (org-agenda-show-inherited-tags nil)
                                          (org-agenda-prefix-format "   %-2i %?b")
                                          (org-agenda-skip-function '(my/org-agenda-skip-habits-and-archive))
                                          (org-agenda-todo-keyword-format "")))
          (tags "+TODO=\"HOLD\"" (
                                  (org-agenda-overriding-header "\n❌ On Hold")
                                  (org-agenda-remove-tags nil)
                                  (org-tags-match-list-sublevels nil)
                                  (org-agenda-show-inherited-tags nil)
                                  (org-agenda-prefix-format "   %-2i %?b")
                                  (org-agenda-skip-function '(my/org-agenda-skip-habits-and-archive))
                                  (org-agenda-todo-keyword-format "")))
          ))))

;;;-----#END org cutom agenda view-------------
;;;
;;;-----#END org mode-------------

;;;------#START google cal sync---------
;; (require 'org-gcal)
;; (setq org-gcal-client-id "578676487259-rh3vsodv5k2oatm35vn6j40pj9r1un1j.apps.googleusercontent.com"
;;       org-gcal-client-secret "5Sg-xaxs8B1vjTEHVokXhLek"
;;       org-gcal-fetch-file-alist '(("nandaja.varma@sighup.io" .  "~/Workspace/agenda/schedule.org")))
;;;------#END google cal sync---------

;;;------#START go code stuff---------
;;; inspiration https://dr-knz.net/a-tour-of-emacs-as-go-editor.html
;;; Most of the following codeblocks is from there
(require 'yasnippet)
(yas-global-mode 1)

(add-hook 'before-save-hook 'gofmt-before-save)

;;; the following code basically builds with linter
(flycheck-define-checker go-build-escape
  "A Go escape checker using `go build -gcflags -m'."
  :command ("go" "build" "-gcflags" "-m"
            (option-flag "-i" flycheck-go-build-install-deps)
            ;; multiple tags are listed as "dev debug ..."
            (option-list "-tags=" flycheck-go-build-tags concat)
            "-o" null-device)
  :error-patterns
  (
   (warning line-start (file-name) ":" line ":"
            (optional column ":") " "
            (message (one-or-more not-newline) "escapes to heap")
            line-end)
   (warning line-start (file-name) ":" line ":"
            (optional column ":") " "
            (message "moved to heap:" (one-or-more not-newline))
            line-end)
   (info line-start (file-name) ":" line ":"
         (optional column ":") " "
         (message "inlining call to " (one-or-more not-newline))
         line-end)
   )
  :modes go-mode
  :predicate (lambda ()
               (and (flycheck-buffer-saved-p)
                    (not (string-suffix-p "_test.go" (buffer-file-name)))))\
  )

(with-eval-after-load 'flycheck
  (add-to-list 'flycheck-checkers 'go-build-escape)
  (flycheck-add-next-checker 'go-gofmt 'go-build-escape))

                                        ; lsp, if enabled, disables the flycheck checkers by default.
                                        ; Re-add ours in that case.
(add-hook 'lsp-configure-hook
          (lambda ()
            (when (eq major-mode 'go-mode)
                  (flycheck-add-next-checker 'lsp 'go-build-escape)))
          100)

(add-hook 'before-save-hook #'lsp-organize-imports)
(add-hook 'before-save-hook #'lsp-format-buffer)
;;;------#END go code stuff---------


;;;------#START calfw calendar---------
(add-to-list 'load-path
             (expand-file-name "straight/repos/emacs-calfw"
                               (concat doom-local-dir)))

(defun my/collect-habits ()
       "Collect all habits from agenda files, return list of (name streak-info)."
       (let ((files (directory-files-recursively "~/Workspace/notes/agenda/" "\\.org$"))
             habits)
         (dolist (file files)
           (with-temp-buffer
             (insert-file-contents file)
             (org-mode)
             (goto-char (point-min))
             (while (re-search-forward ":STYLE:\\s-*habit" nil t)
               (save-excursion
                 (org-back-to-heading t)
                 (let* ((heading (org-get-heading t t t t))
                        (scheduled (org-get-scheduled-time (point)))
                        (state (org-get-todo-state))
                        (repeat (when scheduled
                                  (save-excursion
                                   (when (re-search-forward "SCHEDULED:\\s-*<[^>]+\\(\\+[^>]+\\)>" (org-entry-end-position) t)
                                     (match-string 1))))))
                   (push (list :name heading
                               :state (or state "")
                               :repeat (or repeat "")
                               :scheduled scheduled)
                         habits))))))
         (nreverse habits)))

(defvar my/dashboard-show-keys nil
  "Whether to show keybindings in the dashboard habits panel.")

(defun my/dashboard-toggle-keys ()
       "Toggle keybindings display in the habits panel."
       (interactive)
       (setq my/dashboard-show-keys (not my/dashboard-show-keys))
       (my/dashboard-render-habits))

(defun my/dashboard-render-habits ()
  "Re-render the habits panel."
  (let ((habits (my/collect-habits))
        (habit-buf (get-buffer-create "*Habits*"))
        (habit-lines nil)
        (keys-lines nil))
    (push (propertize "  Daily Habits" 'face '(:height 1.1 :weight bold)) habit-lines)
    (if (null habits)
        (push "  No habits found." habit-lines)
        (dolist (h habits)
          (let ((name (plist-get h :name))
                (state (plist-get h :state)))
            (push (format "  %s %s" (if (string= state "DONE") "✅" "⬜") name) habit-lines))))
    (push (propertize (format "  [?] %s keys"
                              (if my/dashboard-show-keys "hide" "show"))
                              'face 'font-lock-comment-face)
          habit-lines)
    (setq habit-lines (nreverse habit-lines))
    (when my/dashboard-show-keys
      (setq keys-lines
            (list
             (propertize "  Keybindings" 'face '(:height 1.1 :weight bold))
             (propertize "  Calendar" 'face '(:weight bold))
             "  h/l  prev/next day"
             "  j/k  next/prev week"
             "  H/L  prev/next month"
             "  M W T D  month/week/2wk/day"
             "  t    go to today"
             "  a    add event"
             (propertize "  Global" 'face '(:weight bold))
             "  SPC o c  dashboard"
             "  SPC n d  garden"
             "  SPC n n  new note"
             "  SPC X    capture")))
    (with-current-buffer habit-buf
      (let ((inhibit-read-only t)
            (half-width (max 35 (/ (frame-width) 2)))
            (max-lines (max (length habit-lines) (length (or keys-lines '())))))
            (erase-buffer)
            (insert "\n")
            (dotimes (i max-lines)
              (let* ((left (or (nth i habit-lines) ""))
                     (right (if keys-lines (or (nth i keys-lines) "") ""))
                     (left-plain (substring-no-properties left))
                     (pad (max 1 (- half-width (length left-plain)))))
                (insert left)
                (when (not (string-empty-p right))
                  (insert (make-string pad 32))
                  (insert (propertize right 'face 'font-lock-comment-face)))
                (insert "\n"))))
      (special-mode)
      (local-set-key (kbd "?") #'my/dashboard-toggle-keys)
      (goto-char (point-min)))))

;; Google Calendar iCal URLs (get from Google Calendar Settings → "Secret address in iCal format")
(defvar my/gcal-work-url nil
  "Secret iCal URL for work Google Calendar. Set this to enable.")
(defvar my/gcal-personal-url nil
  "Secret iCal URL for personal Google Calendar. Set this to enable.")

(defun my/open-dashboard ()
       "Open calfw calendar with habits listed below."
       (interactive)
       (require 'calfw)
       (require 'calfw-org)
       (require 'calfw-ical)
       (let* ((org-files (directory-files-recursively "~/Workspace/notes/agenda/" "\\.org$"))
              (sources (list (calfw-org-create-source org-files "Agenda" "medium purple"))))
         ;; Add Google calendars if configured
         (when my/gcal-work-url
           (push (calfw-ical-create-source my/gcal-work-url "Work" "SteelBlue") sources))
         (when my/gcal-personal-url
           (push (calfw-ical-create-source my/gcal-personal-url "Personal" "ForestGreen") sources))
         (calfw-open-calendar-buffer
          :contents-sources sources))
       )

(defun my/calfw-capture-on-date ()
       "Capture a new agenda item scheduled for the date under cursor in calfw.
Asks for optional start and end time to create a timed event."
       (interactive)
       (let* ((date (calfw-cursor-to-nearest-date))
              (datestr (when date
                         (format "%04d-%02d-%02d %s"
                                 (nth 2 date) (nth 0 date) (nth 1 date)
                                 (calendar-day-name date))))
              (start-time (read-string "Start time (e.g. 14:00, or empty for all-day): "))
              (end-time (when (not (string-empty-p start-time))
                          (read-string "End time (e.g. 15:00, or empty for open-ended): ")))
              (timestamp (cond
                          ((string-empty-p start-time)
                           (format "<%s>" datestr))
                          ((or (null end-time) (string-empty-p end-time))
                           (format "<%s %s>" datestr start-time))
                          (t
                           (format "<%s %s-%s>" datestr start-time end-time)))))
         (if (not datestr)
             (message "No date under cursor")
           (let ((my/calfw-timestamp timestamp))
             (org-capture)))))

(with-eval-after-load 'calfw
  (evil-define-key 'normal calfw-calendar-mode-map
    "a" #'my/calfw-capture-on-date
    "h" #'calfw-navi-previous-day-command
    "l" #'calfw-navi-next-day-command
    "j" #'calfw-navi-next-week-command
    "k" #'calfw-navi-previous-week-command
    "H" #'calfw-navi-previous-month-command
    "L" #'calfw-navi-next-month-command
    "t" #'calfw-navi-goto-today-command
    "q" #'quit-window
    "gr" #'calfw-refresh-calendar-buffer
    (kbd "RET") #'calfw-show-details-command
    "M" #'calfw-change-view-month
    "W" #'calfw-change-view-week
    "T" #'calfw-change-view-two-weeks
    "D" #'calfw-change-view-day))

;; Open dashboard after Doom fully loads
(add-hook 'doom-after-init-hook #'my/open-dashboard)

;; Quick access
(map! :leader
      :desc "Dashboard"
      "o c" #'my/open-dashboard)
;;;------#END calfw calendar---------

;;;------#START very large files---------
                                        ;(require 'vlf-setup)
;;;------#END very large files---------

;;;------#START notdeft config---------
(use-package! notdeft
  :commands (notdeft notdeft-open-query)
  :config
  (setq notdeft-directories '("~/Workspace/notes/garden"))
  (setq notdeft-extension "org")
  (setq notdeft-secondary-extensions '("md"))
  (setq notdeft-xapian-program
        (expand-file-name "straight/repos/notdeft/xapian/notdeft-xapian"
                          doom-local-dir)))

;; Enable deft: links in org-mode for wiki-style linking between garden notes
(use-package! notdeft-org
  :after org
  :config
  ;; Use notdeft-org9 for modern org-mode link support
  (require 'notdeft-org9))

;;;------#END notdeft config---------

;;;------#START garden browser---------
(defvar my/garden-directory "~/Workspace/notes/garden/"
  "Directory containing garden notes.")

(defvar my/garden-tag-icons
  '(("book" . "📚")
    ("learn" . "🎓")
    ("project" . "🛹")
    ("networking" . "🌐")
    ("writing" . "✍️")
    ("personal" . "🌱")
    ("reference" . "📖")
    ("work" . "💼"))
  "Icons for garden tags.")

(defun my/garden--parse-note (file)
       "Parse FILE and return (title tags mtime) or nil."
       (let ((mtime (float-time (file-attribute-modification-time
                                 (file-attributes file))))
             title tags)
         (with-temp-buffer
           (insert-file-contents file nil 0 1000)
           (goto-char (point-min))
           (when (re-search-forward "^#\\+\\(?:title\\|TITLE\\):\\s-*\\(.*\\)" nil t)
             (setq title (string-trim (match-string 1))))
           (goto-char (point-min))
           (when (re-search-forward "^#\\+FILETAGS:\\s-*\\(.*\\)" nil t)
             (setq tags (split-string (match-string 1) ":" t "\\s-*"))))
         (list :file file
               :title (or title (file-name-sans-extension
                                 (file-name-nondirectory file)))
               :tags (or tags '("untagged"))
               :mtime mtime)))

(defun my/garden-browse ()
       "Open a buffer showing garden notes organized by tag, newest first."
       (interactive)
       (let* ((files (directory-files (expand-file-name my/garden-directory)
                                      t "\\.org$"))
              (notes (mapcar #'my/garden--parse-note files))
              (tag-map (make-hash-table :test 'equal))
              (buf (get-buffer-create "*Garden*")))
         ;; Group by tag
         (dolist (note notes)
           (dolist (tag (plist-get note :tags))
             (puthash tag (cons note (gethash tag tag-map)) tag-map)))
         ;; Sort tags alphabetically, sort notes by mtime within each
         (let ((sorted-tags (sort (hash-table-keys tag-map) #'string<)))
           (with-current-buffer buf
             (let ((inhibit-read-only t))
               (erase-buffer)
               (insert (propertize "  🌿 Garden Notes\n"
                                   'face '(:height 1.4 :weight bold)))
               (insert (propertize (format "  %d notes across %d tags\n\n"
                                           (length notes) (length sorted-tags))
                                   'face 'font-lock-comment-face))
               ;; Search shortcut hint
               (insert (propertize "  [f] find by title  [/] search content  [q] quit  [RET] open  [n] new note  [gr] refresh\n\n"
                                   'face 'font-lock-comment-face))
               (dolist (tag sorted-tags)
                 (let* ((tag-notes (gethash tag tag-map))
                        (sorted-notes (sort tag-notes
                                            (lambda (a b)
                                              (> (plist-get a :mtime)
                                                 (plist-get b :mtime)))))
                        (icon (or (cdr (assoc tag my/garden-tag-icons)) "📄"))
                        (count (length sorted-notes)))
                   ;; Tag header
                   (insert (propertize (format "  %s %s (%d)\n"
                                               icon
                                               (capitalize tag)
                                               count)
                                       'face '(:height 1.2 :weight bold)
                                       'my/garden-tag tag))
                   ;; Notes under tag
                   (dolist (note sorted-notes)
                     (let ((title (plist-get note :title))
                           (file (plist-get note :file))
                           (mtime (plist-get note :mtime)))
                       (insert "    ")
                       (insert-text-button
                        title
                        'action (lambda (btn)
                                  (find-file (button-get btn 'my/file)))
                        'my/file file
                        'face 'link
                        'follow-link t)
                       (insert (propertize
                                (format "  %s\n"
                                        (format-time-string "%Y-%m-%d" mtime))
                                'face 'font-lock-comment-face))))
                   (insert "\n"))))
             (goto-char (point-min))
             (my/garden-mode)))
         (switch-to-buffer buf)))

(define-derived-mode my/garden-mode special-mode "Garden"
  "Mode for browsing garden notes."
  (setq-local revert-buffer-function
              (lambda (_ignore-auto _noconfirm)
                (my/garden-browse))))

(defun my/garden-search ()
       "Search garden notes by content."
       (interactive)
       (let ((default-directory (expand-file-name my/garden-directory)))
         (consult-ripgrep default-directory)))

(defun my/garden-find-by-title ()
       "Find a garden note by title with fuzzy matching."
       (interactive)
       (let* ((files (directory-files (expand-file-name my/garden-directory) t "\\.org$"))
              (titles (mapcar
                       (lambda (f)
                         (let ((title nil))
                           (with-temp-buffer
                             (insert-file-contents f nil 0 500)
                             (goto-char (point-min))
                             (when (re-search-forward "^#\\+\\(?:title\\|TITLE\\):\\s-*\\(.*\\)" nil t)
                               (setq title (string-trim (match-string 1)))))
                           (cons (or title (file-name-sans-extension (file-name-nondirectory f)))
                                 f)))
                       files))
              (choice (completing-read "Note: " (mapcar #'car titles) nil t))
              (file (cdr (assoc choice titles))))
         (when file (find-file file))))

(defun my/garden-insert-link ()
       "Insert a deft: link to another garden note."
       (interactive)
       (let* ((files (directory-files (expand-file-name my/garden-directory) t "\\.org$"))
              (titles (mapcar
                       (lambda (f)
                         (let ((title nil))
                           (with-temp-buffer
                             (insert-file-contents f nil 0 500)
                             (goto-char (point-min))
                             (when (re-search-forward "^#\\+\\(?:title\\|TITLE\\):\\s-*\\(.*\\)" nil t)
                               (setq title (string-trim (match-string 1)))))
                           (cons (or title (file-name-sans-extension (file-name-nondirectory f)))
                                 f)))
                       files))
              (choice (completing-read "Link to: " (mapcar #'car titles) nil t))
              (file (cdr (assoc choice titles)))
              (filename (file-name-nondirectory file)))
         (insert (format "[[deft:%s][%s]]" filename choice))))

(map! :leader
      :desc "Insert garden link"
      "n l" #'my/garden-insert-link)

(evil-define-key 'normal my/garden-mode-map
  "q" #'quit-window
  (kbd "RET") #'push-button
  "f" #'my/garden-find-by-title
  "/" #'my/garden-search
  "n" #'my/create-garden-note
  "gr" #'revert-buffer)

(map! :leader
      :desc "Garden browse"
      "n d" #'my/garden-browse)
;;;------#END garden browser---------

;;;------#START hugo config---------
;; Load ox-hugo
(after! ox
  (require 'ox-hugo))

;; Setup default properties for Terminal theme
(defun my/org-hugo-terminal-setup ()
       "Setup for Terminal theme exports"
       (org-set-property "HUGO_THEME" "terminal")
       (org-set-property "HUGO_MENU" "main")
       (org-set-property "HUGO_CUSTOM_FRONT_MATTER" ":showDate true :showShare false"))

;; Function to publish org files to Hugo
(defun my/publish-org-to-hugo ()
       "Export org files with HUGO_PUBLISH property set to true."
       (interactive)
       (let ((files (directory-files-recursively "~/Workspace/notes/garden" "\\.org$")))
         (dolist (file files)
           (with-current-buffer (find-file-noselect file)
             (save-excursion
               (goto-char (point-min))
               (when (re-search-forward "^#\\+HUGO_PUBLISH:\\s-*true" nil t)
                 (message "Publishing %s" file)
                 (org-hugo-export-to-md)))))))
;; Bind to a key
(map! :leader
      :desc "Publish org to Hugo"
      "o h" #'my/publish-org-to-hugo)
;;;------#END very large files---------


;;;------#START ERC Connection---------
(setq erc-autojoin-channels-alist
      '(("libera.chat" "#lobsters")))

(setq erc-nick "nandgate")

;; Auto-connect function
(defun my/connect-libera ()
       "Connect to Libera.Chat"
       (interactive)
       (erc :server "irc.libera.chat" :port 6667 :nick "nandgate"))

;;;------#END ERC Connection---------
