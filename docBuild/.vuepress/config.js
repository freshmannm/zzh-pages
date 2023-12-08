module.exports = {
    title: '渣渣辉记录文档',// 设置网站标题
    description: '文档',
    base: '/',   // 设置站点根路径
    dest: './docs',  // 设置输出目录
    port: 8086,
    head: [], // 增加一个自定义的 favicon // 增加一个自定义的 favicon],
    plugins: [],
    themeConfig: {
        // 添加导航栏
        nav: [
            {text: 'home', link: '/'},
            {text: '日常', link: '/foo/'},
        ],
        // 为以下路由添加左侧边栏
        sidebar: {
            '/foo/': [
                {
                    title: '记录',
                    collapsable: false,
                    children: [
                        {title: '代码块', path: '/foo/'},
                    ]
                }
            ],
        },
        sidebarDepth: 1,//左侧导航显示的层级
        lastUpdated: 'Last Updated'
    }
}
