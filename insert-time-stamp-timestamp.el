(defun earned:insert-time-stamp-timestamp ()
  "日期时间格式输出为：<2018-04-06 Fri 09:12:41 UTC+08:00>

\"<%Y-%m-%d %a %H:%M:%S UTC%:z>\"

- 如果当前光标处于时间戳，那么更新时间戳里的时间
- 强制使用英文的星期"
  (interactive)
  (when (and (fboundp 'org-at-timestamp-p)
             (org-at-timestamp-p))
    (replace-match ""))
  (insert
   (let ((system-time-locale "ENU"))
     (format-time-string "<%Y-%m-%d %a %H:%M:%S UTC%:z>"))))
