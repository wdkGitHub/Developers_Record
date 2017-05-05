//1.将前台数据格式化JSON数据[{},{},{}]

		var featureCodes = [];
		var objectData = {
				stuId:123, stuname:'stuname', password:'password',age:22, sex:1
		};
		featureCodes.push(objectData);
		featureCodes.push(objectData);
		featureCodes.push(objectData);

		console.log(JSON.stringify(featureCodes));


//2.后台接收前台JSON数据转换成JAVA对象


		String strJson="{\"id\":123,\"stuname\":\"stuName\",\"password\":\"machineType\",\"sex\":1,\"age\":22}";
		String strArr="[{\"id\":123,\"stuname\":\"stuName\",\"password\":\"machineType\",\"sex\":1,\"age\":22},{\"id\":123,\"stuname\":\"stuName\",\"password\":\"machineType\",\"sex\":1,\"age\":22},{\"id\":123,\"stuname\":\"stuName\",\"password\":\"machineType\",\"sex\":1,\"age\":22}]";
		//1、使用JSONObject
		JSONObject jsonObject=JSONObject.fromObject(strJson);
		Students stu=(Students)JSONObject.toBean(jsonObject, Students.class);
		//2、使用JSONArray
		JSONArray jsonArray=JSONArray.fromObject(strArr);
		//获得jsonArray的第i个元素
		int i=0;
		for (Object object : jsonArray) {
			i++;
			Object o=object;
			JSONObject jsonObject2=JSONObject.fromObject(o);
			Student stu2=(Student)JSONObject.toBean(jsonObject2, Students.class); 
			System.out.println("stu2:"+i+":"+stu2);
		}
		
		System.out.println("stu:"+stu);

//3.将集合对象传入MyBatis操作

	<!--List:forech中的collection属性类型是List,collection的值必须是:list,item的值可以随意,Dao接口中参数名字随意 -->
    <select id="getEmployeesListParams" resultType="Employees">
        select *
        from EMPLOYEES e
        where e.EMPLOYEE_ID in
        <foreach collection="list" item="employeeId" index="index"
            open="(" close=")" separator=",">
            #{employeeId}
        </foreach>
    </select>

    <!--Array:forech中的collection属性类型是array,collection的值必须是:list,item的值可以随意,Dao接口中参数名字随意 -->
    <select id="getEmployeesArrayParams" resultType="Employees">
        select *
        from EMPLOYEES e
        where e.EMPLOYEE_ID in
        <foreach collection="array" item="employeeId" index="index"
            open="(" close=")" separator=",">
            #{employeeId}
        </foreach>
    </select>

    <!--Map:不单单forech中的collection属性是map.key,其它所有属性都是map.key,比如下面的departmentId -->
    <select id="getEmployeesMapParams" resultType="Employees">
        select *
        from EMPLOYEES e
        <where>
            <if test="departmentId!=null and departmentId!=''">
                e.DEPARTMENT_ID=#{departmentId}
            </if>
            <if test="employeeIdsArray!=null and employeeIdsArray.length!=0">
                AND e.EMPLOYEE_ID in
                <foreach collection="employeeIdsArray" item="employeeId"
                    index="index" open="(" close=")" separator=",">
                    #{employeeId}
                </foreach>
            </if>
        </where>
    </select>

//4.批量插入	
	
	<insert id="addBatch" parameterType="java.util.List">
		INSERT INTO T_STUDENT (ID,AGE,STUNAME,PASSWORD,SEX)
		SELECT T_STUDENT_SEQ.NEXTVAL  ID, A.*
		FROM(
		<foreach collection="list" item="item" index="index"
			separator="UNION ALL">
			SELECT
			#{item.age,jdbcType=INTEGER} AGE,
			#{item.stuname,jdbcType=VARCHAR} STUNAME,
			#{item.password,jdbcType=VARCHAR} PASSWORD,
			#{item.sex,jdbcType=INTEGER} SEX 
			FROM dual
		</foreach>
		)A
	</insert>

	<insert id="insertBatch" parameterType="java.util.List">
		BEGIN
		<foreach collection="list" item="item" index="index"
			separator=";">
			INSERT INTO T_STUDENT (ID,AGE,STUNAME,PASSWORD,SEX) VALUES
			(T_STUDENT_SEQ.NEXTVAL,#{item.age},#{item.stuname},#{item.password},#{item.sex} )
		</foreach>
		;END ;
	</insert>



	<insert id="insertBatch" parameterType="java.util.List">
		BEGIN
		<foreach collection="list" item="item" separator=";">
			INSERT INTO T_STUDENT (ID, AGE, STUNAME, PASSWORD,
			SEX)VALUES(T_STUDENT_SEQ.NEXTVAL,
			#{item.age},#{item.stuname},#{item.password} ,#{item.sex} )
		</foreach>
		;END;
	</insert>
	
	
	<insert id="addArrBatch" >
		BEGIN
		<foreach collection="array" item="item" separator=";">
			INSERT INTO T_STUDENT (ID, AGE, STUNAME, PASSWORD,
			SEX)VALUES(T_STUDENT_SEQ.NEXTVAL,
			#{item.age},#{item.stuname},#{item.password} ,#{item.sex} )
		</foreach>
		;END;
	</insert>
	
	
	<!-- lstMap特别注意：是在Service定义放入Map结构的KEY -->
	<insert id="addMapBatch" >
		BEGIN
		<foreach collection="lstMap" item="item" separator=";">
			INSERT INTO T_STUDENT (ID, AGE, STUNAME, PASSWORD,
			SEX)VALUES(T_STUDENT_SEQ.NEXTVAL,
			#{item.age},#{item.stuname},#{item.password} ,#{item.sex} )
		</foreach>
		;END;
	</insert>