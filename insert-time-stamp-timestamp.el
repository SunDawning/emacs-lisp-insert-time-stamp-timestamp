(defun earned:insert-time-stamp-timestamp ()
  "日期时间格式输出为：<2018-04-06 Fri 09:12:41 UTC+08:00>

\"<%Y-%m-%d %a %H:%M:%S UTC%:z>\"

- 如果当前光标处于时间戳，那么更新时间戳里的时间
- 在Windows下强制使用英文的星期，避免日期时间乱码
  win10 下 emacs org-mode agenda时间乱码 问题 | Maple's Blog: https://www.cqmaple.com/201709/win10-emacs-org-mode-agenda-time.html"
  (interactive)
  (when (and (fboundp 'org-at-timestamp-p)
             (org-at-timestamp-p))
    (replace-match ""))
  (insert
   (let ((system-time-locale (when (functionp (function w32-list-locales)) "ENU")))
     (format-time-string "<%Y-%m-%d %a %H:%M:%S UTC%:z>"))))
