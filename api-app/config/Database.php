<?php

class Database {
    // ملاحظة: لم نعد نعطي هذه الخصائص قيمًا افتراضية هنا.
    // سيتم تعيين قيمها من المتغيرات البيئية داخل الكونستركتر.
    private $hostname;
    private $username;
    private $password;
    private $database;
    private $database_connection;

    // **هذا هو الجزء الجديد والمهم: الكونستركتر**
    public function __construct() {
        // نقرأ قيم المتغيرات البيئية باستخدام getenv()
        // ونستخدم عامل التشغيل '?:' لتعيين قيمة افتراضية إذا لم يكن المتغير موجودًا (كحماية إضافية)
        $this->hostname = getenv('DB_HOST') ?: 'localhost'; // إذا لم يجد المتغير، يستخدم localhost
        $this->username = getenv('DB_USER') ?: 'root';      // قيمة افتراضية: root
        $this->password = getenv('DB_PASS') ?: '';          // قيمة افتراضية: فارغة
        $this->database = getenv('DB_NAME') ?: '';          // قيمة افتراضية: فارغة
    }

    public function connect() {
        mysqli_report(MYSQLI_REPORT_OFF);

        // الآن تم ملء الخصائص بالقيم الصحيحة من الكونستركتر
        $this->database_connection = mysqli_connect(
            $this->hostname,
            $this->username,
            $this->password,
            $this->database
        );

        if (!$this->database_connection) {
            // يمكنك تسجيل الخطأ في سجل الأخطاء بدلاً من عرضه للمستخدم
            error_log("Connection failed: " . mysqli_connect_error());
            return false; // أو يمكنك إرجاع null أو رمي استثناء
        }

        mysqli_set_charset($this->database_connection, "utf8mb4");
        // يمكنك أيضًا تنفيذ هذه الأوامر إذا احتجتها
        $this->database_connection->query("SET NAMES utf8mb4");
        $this->database_connection->query("SET CHARACTER SET utf8mb4");

        return $this->database_connection;
    }

    public function close() {
        if ($this->database_connection) {
            mysqli_close($this->database_connection);
        }
    }
}


