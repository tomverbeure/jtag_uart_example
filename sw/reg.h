#ifndef REG_H
#define REG_H

#define REG_WR(reg_name, wr_data)                   (*((volatile uint32_t *)(reg_name##_ADDR)) = (wr_data))
#define REG_RD(reg_name)                            (*((volatile uint32_t *)(reg_name##_ADDR)))

#define FIELD_MASK(reg_name, field_name)            ( ((1<<(reg_name##_##field_name##_FIELD_LENGTH))-1) << (reg_name##_##field_name##_FIELD_START))

#define REG_WR_FIELD(reg_name, field_name, wr_data) (*((volatile uint32_t *)(reg_name##_ADDR)) = \
                                                                ((REG_RD(reg_name) \
                                                                & ~FIELD_MASK(reg_name, field_name)) \
                                                                | (((wr_data)<<(reg_name##_##field_name##_FIELD_START)) & FIELD_MASK(reg_name, field_name))))

#define REG_RD_FIELD(reg_name, field_name)          ((REG_RD(reg_name) & FIELD_MASK(reg_name, field_name)) >> (reg_name##_##field_name##_FIELD_START))

#define MEM_WR(mem_name, wr_addr, wr_data)          (*( (volatile uint32_t *)(mem_name##_ADDR) + (wr_addr)) = (wr_data))

#define MEM_RD(mem_name, rd_addr)                   (*((volatile uint32_t *)((mem_name##_ADDR) + ((rd_addr) << 2))))

#endif
