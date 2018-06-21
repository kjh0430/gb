package com.crm.gb.emp.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

import com.crm.gb.emp.exception.EmpLoginFailException;
import com.crm.gb.emp.model.vo.Emp;

@Repository("empDao")
public class EmpDao {

   @Autowired
   private SqlSessionTemplate sqlSession;
   
   @Autowired
   private BCryptPasswordEncoder pwdEncoder;
   
   
   /** 로그인처리 Dao */
   public Emp selectEmp(Emp emp) throws EmpLoginFailException{
      
      Emp resultEmp=sqlSession.selectOne("emp.loginEmp", emp);
      
      if(pwdEncoder.matches(emp.getEmp_pwd(), resultEmp.getEmp_pwd())) {
         return resultEmp;
      }else {
         throw new EmpLoginFailException("아이디와 비밀번호를 확인하세요!!");
      }
   }

   /*사원 등록*/
   public int insertEmp(Emp emp) {
      return sqlSession.insert("empInsert", emp);
   }

   /*사원 정보 수정*/
   public int updateEmp(Emp emp) {
      return sqlSession.update("empUpdate", emp);
   }

   /*사원 삭제여부 수정*/
   public int updateEmpDelete(int emp_no) {
      return sqlSession.update("updateEmpDelete", emp_no);
   }

   /*사원 조회*/
   public Emp selectEmpNo(int emp_no) {
      return sqlSession.selectOne("detailEmp", emp_no);
   }

   /*사원 전체 조회*/
   public ArrayList<Emp> selectEmpList() {
      return (ArrayList)sqlSession.selectList("empList");
   }

   /*연락처 중복검사*/
   public Emp selectCheckPhone(String emp_phone) {
      System.out.println("emp_phone dao 실행");   
      System.out.println("emp_phone : " + emp_phone);
      return sqlSession.selectOne("selectCheckPhone", emp_phone);
   }
   
   /*이메일 중복검사*/
   public Emp selectCheckEmail(String emp_email) {
      return sqlSession.selectOne("selectCheckEmail", emp_email);
   }

   public ArrayList<Emp> selectDeptEmp(Emp emp) {
      return (ArrayList)sqlSession.selectList("selectDeptEmp",emp);
   }

   /*상사이름 조회*/
   public Emp selectMgrNo(int emp_no) {
      return sqlSession.selectOne("selectMgrNo", emp_no);
   }

   public Emp selectMyInfo(Emp emp) {
      
      return sqlSession.selectOne("selectMyInfo",emp);
   }

   public Emp selectEmail(Emp emp) {
      
      return sqlSession.selectOne("selectEmail",emp);
   }

   public Emp selectPhoneckdupl(Emp emp) {
      return sqlSession.selectOne("selectPhonedupl",emp);
   }

   public int updateMyInfo(Emp emp) {
      
      return sqlSession.update("updateMyInfo",emp);
   }


   public int updatePassword(Emp emp) {
      
      return sqlSession.update("updatePassword",emp);
   }

   /*사원목록 갯수*/
   public Emp selectEmpListCount2() {
	  return sqlSession.selectOne("selectEmpListCount");
   }
   
   /*사원목록 페이징*/
   public ArrayList<Emp> selectEmpList(Emp emp) {
	  return (ArrayList)sqlSession.selectList("empListPage", emp);
   }

   /*상사번호 목록*/
   public ArrayList<Emp> selectMgrList(Emp emp) {
	   return (ArrayList)sqlSession.selectList("mgrList", emp);
   }

   /*상사목록 검색*/
   public ArrayList<Emp> selectEmpSearch(Emp emp) {
	   return (ArrayList)sqlSession.selectList("empSearch", emp);
   }

   public Emp selectEmpListCount(Emp emp) {
	   System.out.println("selectListCount 여기까지 실행");
	   return sqlSession.selectOne("selectSearchCount", emp); 
   }
   
}
