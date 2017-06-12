define(function(require, exports, module) {
    var API;

    API = {
        // 2.0登录接口
        login: 'http://192.168.10.2:8080/api/Auth/login',
        //脑适能登录接口
        login_brain: '',
        //2.0获取用户信息
        me: 'http://192.168.10.2:8080/api/Users/me',
        //2.0新建学生档案
        save: 'http://192.168.10.2:8080/api/Cases/create',
        //脑适能新建学生档案
        save_brain: '/teacher/newtab/',
        //2.0新建老师档案
        save_doctor: 'http://192.168.10.2:8080/api/Users/create',
        //脑适能新建老师档案
        save_doctor_brain: '/manager/newtab/',
        //2.0获取信息列表（搜索）
        search: 'http://192.168.10.2:8080/api/Cases/getList',
        //管理员搜索
        search_manager: '/manager/search/',
        //脑适能获取信息列表（搜索）
        search_brain: '/teacher/search/',
        //2.0修改基本信息
        modify_basicinfo: 'http://192.168.10.2:8080/api/Cases/update',
        //脑适能修改基本信息
        modify_basic_info: '/teacher/student/',
        //脑适能学生信息采集
        modify_get_info: '/teacher/collect/',
        //脑适能老师资料设置
        modify_get_teac_info: '/teacher/teacset/',
        //脑适能管理员修改老师
        modify_teacher:'/manager/collect/',
        //脑适能保存检测结果
        save_report: '/teacher/save/',
        // 修改密码
        mpass: '/teacher/mpass/'
}

    module.exports = API;
});